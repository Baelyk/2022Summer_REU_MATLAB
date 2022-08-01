function [polygons, speeds, chordarcs] = speedlimit(num)
	polygons = cell(1, num);
	speeds = zeros(num, 1);
	chordarcs = zeros(num, 1);

	resolution = 10^-3;

	for idx = 1 : num
		fprintf("\r%4u/%4u", idx, num);
		polygon = polygon_fxn(10);
		polygons{idx} = polygon;
		polygon = polygon(1 : end - 1, :);

		speeds(idx) = max(norm(find_velocity(polygon, true, resolution)));
		chordarcs(idx) = find_chordarc(polygon, 10);
	end

	output = [speeds chordarcs];
	filename = "speeds_" + datestr(datetime, 30) + ".csv"
	writematrix(output, filename);
end
