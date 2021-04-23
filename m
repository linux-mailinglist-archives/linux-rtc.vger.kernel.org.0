Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240D236962D
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Apr 2021 17:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhDWPa6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Apr 2021 11:30:58 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:16218 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230294AbhDWPa6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Apr 2021 11:30:58 -0400
X-Greylist: delayed 509 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Apr 2021 11:30:58 EDT
Received: from pps.filterd (m0118788.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13NFDMRv027920;
        Fri, 23 Apr 2021 11:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=Quu2G/JJLgWyj3GrXhWcrXOmOJ/tI9GK++wOURwkToo=;
 b=jsn2+LuHB0gzPaqBUBp0lemHiwclxtPDYEXyxTM98jEUb8H/H/8hjTnFvNWDv13haVYB
 TY9aEvetno919RAOoLV8W2fRl6+8FiUbtACkGOFih9b8AGrX4+gHSWiXUS7POke9BLOb
 UKyeSgUebQNk0K68KNyoJbgnhSIa2uhVt297JGxxWxayqnUyY+ev6EqIhaiWvpFwLUZq
 T27CkL5RaZfl2rb/JIq7uz5H/AMJJRJ3gA7XTzNFi68AR4Fb9v79Vb3KdUd9LGkAx/7U
 71dykdxEQMgVFZ7eq9B09KBZenYV/d/YwGlP2x/n1FPraYpyzan+333DZEypIc0wapYN rg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        by mx0a-002ab301.pphosted.com with ESMTP id 383yaeg3rw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Apr 2021 11:21:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fr3iaQTxUcCHGajXRTdEzkn5dx5iDITmoW7TA9f2w6CiBs/h8cEHpQ3BK7Y29caDoqOCl9/hhga31c6lZ1MpBHNK+NwDCA4+V3J0z+RbRLzeVPYynb0YH+FYwj1okWmeUxKcsMQT5ZN9VyhsMpRxTxlCQOtWh1sJR2PeCXmZBJ6p3+R/lQndn9Eb032mxiYYIQumzRuuTgMJtE7pOLlnQu0PJrzXi3qF4fAZCqIM+SGC7swInRHNfNlfZUT7veTM4p2YEmqnAgFQPKIOLzX+BkKcwguAEBcP+hewhoRcLOecjf8zeOM8Fx4wJzVPdrgBKRWjDsK1koNtNMY2X/jpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Quu2G/JJLgWyj3GrXhWcrXOmOJ/tI9GK++wOURwkToo=;
 b=OYfUkZTjemBRQkmRgzmqOxpxaqVkIDx4sMbBzMPR8LpqE2irhIWHtJtm5IUVREKhByvZgvicRCI5G61DWpV7AMOc6TzfG6G0228MPbwtH8RzJsWb+5zCDV5ypxIY7mTo7Qgj0NyEUhweHOljBiOhVuitc9ObXDWGcIeFfdYzfXNvbLsYXmEFoxR3833Q8QFG17tt/72E2KO1T4F1Ny06KvOC38CA4M/PtTnzrLOPfTsjIAejnTgWDUYgFVtmkCllKiDX03/198Z4bXuXetvJBTrSdB4SS0VcVJQbXtX1w3G80CDQt0nEyHQAFlwfPYSvdLgfY1eF8yxXiuOuv7kEAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Quu2G/JJLgWyj3GrXhWcrXOmOJ/tI9GK++wOURwkToo=;
 b=eKSkU1joBxMwoxRxANS+Qm8iHBhIs/lHHzDw/PM+gIfRR3g29GOSQcF9WBLZYypNcxIEvf9rl0GZ+MiKAN9VUpIe77pY3jfD0kTDcqoDQ9mgMJ+3jg1vupMmTh+dP22uJaA9Hyfs+CVkopIsKXdQjeiDcL3vOfqMw7u0a6LrxFU=
Received: from SN6PR01MB4269.prod.exchangelabs.com (2603:10b6:805:ad::23) by
 SA1PR01MB6608.prod.exchangelabs.com (2603:10b6:806:184::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Fri, 23 Apr 2021 15:21:33 +0000
Received: from SN6PR01MB4269.prod.exchangelabs.com
 ([fe80::a960:87f5:c3ed:da0b]) by SN6PR01MB4269.prod.exchangelabs.com
 ([fe80::a960:87f5:c3ed:da0b%5]) with mapi id 15.20.4042.024; Fri, 23 Apr 2021
 15:21:33 +0000
From:   "Gervais, Francois" <FGervais@distech-controls.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Michael McCormick <michael.mccormick@enatel.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] rtc: pcf85063: add integrity check
Thread-Topic: [PATCH 1/1] rtc: pcf85063: add integrity check
Thread-Index: AQHXFp722WysSQ6OikqG5IlMHahVT6q37BqAgAR8yVyAACw8AIAF5Ri8
Date:   Fri, 23 Apr 2021 15:21:33 +0000
Message-ID: <SN6PR01MB4269E5EDFCAAA1308AF3EE10F3459@SN6PR01MB4269.prod.exchangelabs.com>
References: <20210311174940.23072-1-fgervais@distech-controls.com>
 <YHoKQ9qtupDhXVm3@piout.net>
 <SN6PR01MB4269E7C0A5B2069F96384A6BF3499@SN6PR01MB4269.prod.exchangelabs.com>,<YH3zCjPBk/aRn/jg@piout.net>
In-Reply-To: <YH3zCjPBk/aRn/jg@piout.net>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=distech-controls.com;
x-originating-ip: [76.67.142.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3013921b-0813-4c7a-4bbd-08d9066b7a40
x-ms-traffictypediagnostic: SA1PR01MB6608:
x-microsoft-antispam-prvs: <SA1PR01MB6608375B46618545FCC6F637F3459@SA1PR01MB6608.prod.exchangelabs.com>
x-pp-identifier: acuityo365
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5W4gpj86IJ8YZsEo1sW0b/MdnwuLMdQpmzcz9dRwmfFtlNA+9T+KyevMDjTDm69vNbLfOAU1y4oDBD0X9bP3+Q3T5oHSzLrW8tcdcy4sVMzQqHbXuYygrGzeTwuV3QUvrzdp38OzoC2IURTPezHbszzVBoIhKhWq2/N3x5hebKeBI324Tn7p2Vbo5yUTNNsQzZovml9Kgt3D6h3UqII8xWNXrIA/122FPg6fuwReL3pczQlZgp4UrZw2F6LMpUYzvqh8WOebb/98sg7ZB0+eq+R7n3gadiYdZ14v4TlFfbsxNwpN63aqVdLVResEDtrqzrXXrHLogd9boAkGdFscj0rOtBHw26/2M+D8fn/7V+ShejSoDEl7DSZilyYSbFonRRlkuL0YHFEUPFSmkzsPtleEbbvb4w23IhSfIDf79BhW+qQJ4FfHPGt5l68PBrrcLVnQCsbEyZx3xq9OQEQk9phDTwhXBJAA/whf9rDCrY9GPHlt74PCZsSrEsaCvQEmo5IjD88aGnHn7nvm/9Gmd26LOF27b/x4fcmhESPYS47X6h+GiCJjxzXOoGkxEbqAWuDozfL+qSQlDmawUWBdaBy2+jKsf5o76k2WBAk3zP0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4269.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39850400004)(26005)(5660300002)(33656002)(38100700002)(478600001)(8936002)(7696005)(122000001)(8676002)(186003)(6506007)(86362001)(2906002)(6916009)(316002)(66556008)(66446008)(54906003)(91956017)(76116006)(55016002)(66946007)(66476007)(4326008)(9686003)(52536014)(64756008)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?oLkHosHsD8YGjEJJj05C/KbfZfa+p4cQGhoAx1/moMGv/4lqc+bqRoPlzG?=
 =?iso-8859-1?Q?6LMJPdu7FPOrs9n8NrzjrIs/L0AYYHTPjvPJISbGgzJ5nRfJ/wwPoFYzA6?=
 =?iso-8859-1?Q?+De4K1HSsW12tmQEAzixOvkK8aA+gvJ+NfbpZo9CyOkoFx9xf0HBWX9CHR?=
 =?iso-8859-1?Q?tf6uozDIeDfa+DbM1IKvX9eY9rJ5sYBjQeMdsiKiy2QoPCNPMSEwTW3kg1?=
 =?iso-8859-1?Q?Cfj9y0E46hbD4uZjNg8pVg6iuSbcdg8xwiy0el6DaNo8zfR1xADB95Zt03?=
 =?iso-8859-1?Q?XLZ8amguqyT0LiDkF7Xg6d8ywF4Vq/vb2s7R9H5g5q7CIAvqLxN1d3fHq3?=
 =?iso-8859-1?Q?EKU1Eus1YBbaR95FHPk8Pnzxu/3SYTus4/u6RkagncfYGfddr9NIVTxJcq?=
 =?iso-8859-1?Q?OnYodyH8Xy2dECHkOrrXxGY1U1AMMuibyqLu+S2F8XbEW5kC3LdkOIZkw9?=
 =?iso-8859-1?Q?DFZFgT+54BTxsBTifXREZRocfGZKzXuRqEsc+UN0dKj887IxPvIp3cpwb9?=
 =?iso-8859-1?Q?Akim+r28CvbVcFDPB2yM9TIaOCYcxGRMfF0SBwFWFBeNbaw4Ba1Ne+dhZF?=
 =?iso-8859-1?Q?2ZJsi/46NvH7gzWlTmkvVzroVLAXHpvSU5qa268Ti+y4KAbN3RKdrO3mHn?=
 =?iso-8859-1?Q?t4j/UNKRVr/T+GkMtu1BIEyje4iPaN4Yb2qI9AbMyborXYDSqqQXW93JVj?=
 =?iso-8859-1?Q?snqdeogZMWR6gRXLcC6wxMVuvaYeBroVfGp+NjxibDfmCuNpoDHUKSqyJ9?=
 =?iso-8859-1?Q?/IEEOjGazmpl+XFvwVm+UkKuS55Mb+HNFEUcBdO/vnQKRb9n/nnaAhS5d7?=
 =?iso-8859-1?Q?uy6eGMpBXiH7NfRNDSkelZa4daSIXBye2I2XjA7nNn3w8zozvfVFzgZCHW?=
 =?iso-8859-1?Q?VsowJAaAL/24fYfOsmN2GXdctiJ6K3e1S5P2eX08qvlp89JKGb0o/KEvEA?=
 =?iso-8859-1?Q?ah7PrtPVmEw/2A2mSL/FQS2U13F0Owx7c9d4ue2Ik5FBGzNM6217Kgqu2S?=
 =?iso-8859-1?Q?ekQLTB8Ww+FQzMAwDxwkkhrNogPhgELi7VLV7cGVW+nwqlmOEf7oghv9XB?=
 =?iso-8859-1?Q?TVdl9u/68cFHW9w2YQC5mAY60JIB4rIdASz6fgg10CJRGZn2awmLLhD9B9?=
 =?iso-8859-1?Q?tV4pnGMNEdi/FavjBHsruS04ZC7XPElE72VPBTTYvtElne7M61FITofnfO?=
 =?iso-8859-1?Q?dKK2bPvyVgx9O6uihQQe5tFS05jrUL1jdZQVqKKJqyNrE1PfT7IByh5kTC?=
 =?iso-8859-1?Q?8uxoBs0UlsbXKx3v0plj4Xu3VBO8LRbWT7ZlKme5RRLtJJSbMe4EKIOsfm?=
 =?iso-8859-1?Q?DE/ewrtwF18tETZMlUengnwr7BOrePTiLOcE/Ngh6508+sw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4269.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3013921b-0813-4c7a-4bbd-08d9066b7a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 15:21:33.1167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYBWgfv+/BZl9qO3ZkZNG0bw+/L6C+57sXPJ/HDe7B1bIFz9XzOqDyYx5P3T3AGviJMtjjEP91gCSXjRczr9Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6608
X-Proofpoint-GUID: bM1F8DHL60tsEUAEvyNIpJfU39o3gLKS
X-Proofpoint-ORIG-GUID: bM1F8DHL60tsEUAEvyNIpJfU39o3gLKS
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 priorityscore=1501
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230099
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>>> I'm not sure I get the use case because PCF85063_REG_CTRL2 should be=0A=
>>> initialized properly after the driver is probed anyway. The other two=
=0A=
>>> can be set from userspace once it detects the oscillator failure which=
=0A=
>>> would be better at deciding the policy anyway.=0A=
>> =0A=
>> Thank you for the feedback I think I understand now.=0A=
>> =0A=
>> We saw the reported problem on devices running kernel v5.4 which doesn't=
=0A=
>> have the common clock framework support and so PCF85063_REG_CTRL2=0A=
>> clkout was not initialized by the kernel and left at hardware default.=
=0A=
>> =0A=
>> I guess with CCF support, if PCF85063_REG_CTRL2 gets corrupted on=0A=
>> power application, on driver probe the clkout value will be set to 0b000=
=0A=
>> or some known default.=0A=
>> =0A=
>> I'm not familiar the CCF, do you know if it's the case that default valu=
es=0A=
>> will be set on boot?=0A=
>=0A=
> The CCF will disable any clocks that are not used on boot so the clock=0A=
> will be either used and configured or not used and disabled.=0A=
=0A=
I see now, thank you for the feedback.=0A=
=0A=
I changed the patch status to "Not Applicable" and archived it.=
