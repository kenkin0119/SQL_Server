--merge
--�ݱ���M�w�n���s�W,�ק�ΧR��
--���Ȥ��ƪ�P�s�Ȥ��ƪ�
--�Y�w�s�b�h�ק���,�Y�O�s�Ȥ�h�s�W���

--�ηs�Ȥ�֨�Ȥ�
merge �Ȥ� as c
using �s�Ȥ� as nc
on c.�Ȥ�s��=nc.�Ȥ�s��
when matched then�@--�Pwhere �Y�D��match�� �h...
	update set �m�W=nc.�m�W,�q��=nc.�q��
when not matched then
	insert (�Ȥ�s��,�m�W,�q��) values(nc.�Ȥ�s��,nc.�m�W,nc.�q��)--�S��into�]���ؼи�ƪ��g�F
; --�N��merge����



--�Y��~�Z�ؼ�>=250,�R���ӫȤ�~�Z�ؼ�
--�Y��~�Z�ؼ�<250,�ӫȤ�~�Z�ؼ�+25
--�|�����~�Z�ؼЪ��Ȥ�,�ӫȤ�~�Z�ؼг]��100
merge �Ȥ�~�Z as cs
using �Ȥ� as c
on cs.�Ȥ�s��=c.�Ȥ�s��
when matched and cs.�~�Z�ؼ�>=250 then  --���R���A�ק� �קK�[���W�L250�ӻ~�R
	delete
when matched then
	update set �~�Z�ؼ�=cs.�~�Z�ؼ�+25

when not matched then
	insert(�Ȥ�s��,�~�Z�ؼ�) values(c.�Ȥ�s��,100);
