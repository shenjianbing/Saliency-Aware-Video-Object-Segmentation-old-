%    Script that gives a demo of the saliency method presented in 
%    Saliency-Aware Geodesic Video Object Segmentation CVPR2015
%
%    Copyright (C) 2015  Wenguan Wang
%
%    You can redistribute and/or modify this software for non-commercial use
%    under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%    For commercial use, contact the author for licensing options.
%
%    Contact: wenguanwang@bit.edu.cn or wenguanwang.china@gmail.com

clc
clear

addpath( genpath( '.' ) );
foldername = fileparts( mfilename( 'fullpath' ) );

options.valScale = 60;
options.alpha = 0.02;
options.salScale = 0.1;
options.color_size = 5;
% Print status messages on screen
options.vocal = true;
options.regnum =500;
options.m = 20;
options.topRate = 0.01;
options.gradLambda = 1;

addpath( genpath( '.' ) );
foldername = fileparts( mfilename( 'fullpath' ) );


videoFiles = dir(fullfile(foldername, 'data', 'inputs'));
videoNUM = length(videoFiles)-2;

for videonum = 1:videoNUM
    videofolder =  videoFiles(videonum+2).name;
    
    if( options.vocal )
       disp( ['Processing:', videoFiles(videonum+2).name]);
    end
    
    options.infolder = fullfile( foldername, 'data', 'inputs',videofolder );
    options.outfolder = fullfile( foldername, 'data', 'outputs', videofolder );
    %Getting final saliency results
    sal{videonum} = computeSaliency(options);
end