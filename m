Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDCAA183764
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2020 18:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgCLR0k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Mar 2020 13:26:40 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:58288 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726254AbgCLR0j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Mar 2020 13:26:39 -0400
Received: from [100.113.0.63] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 68/42-39511-CC07A6E5; Thu, 12 Mar 2020 17:26:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRWlGSWpSXmKPExsWSoS+Yp3umICv
  O4PsKLoslF6+yW7S/W8ZucXnXHDaLY6uvsDmweMxbU+0xfd5PJo/Pm+QCmKNYM/OS8isSWDN+
  rXjOXNDNUXF+40HWBsaXbF2MXByMAkuZJRasvcEE4RxjkXj0ZRVUZjOjxO/en2AOi8AJZom91
  +4xdjFycggJTGKSuLa6BCQhJHCXUeJizwwmkASbgIXE5BMPwDpEBKYwSkyd0s0GkmAWqJb49q
  6NHcQWFgiSeL9lCtAkDqCiYImZTxxBwiICRhJ37i4EK2cRUJV4eWs52ExegViJeYu/sIGUCwl
  USfxc6wMS5hRwlmi4+BnsHkYBWYkvjauZITaJS9x6Mh+sVUJAQGLJnvPMELaoxMvH/1gh6lMl
  TjbdYISI60icvf4EylaSWHZjFiuELStxaX43VNxX4vaEZqg5WhK3Z/2Hmm8hsaS7lQXkNAkBF
  Yl/hyohwjkSb7/MZ4Ow1SQeLroFVS4j8WrpBxZQ6EgITGORmH6yhWkCo8EsJGdD2DoSC3Z/Yo
  OwtSWWLXzNPAscEoISJ2c+YVnAyLKK0TKpKDM9oyQ3MTNH19DAQNfQ0FgXSBqZ6yVW6SbqpZb
  qJqfmlRQlAmX1EsuL9Yorc5NzUvTyUks2MQKTUUohQ/0Oxs1r3+sdYpTkYFIS5Z3gkxUnxJeU
  n1KZkVicEV9UmpNafIhRhoNDSYKXMR8oJ1iUmp5akZaZA0yMMGkJDh4lEd5JeUBp3uKCxNziz
  HSI1ClGXY4JL+cuYhZiycvPS5US5zUEKRIAKcoozYMbAUvSlxhlpYR5GRkYGIR4ClKLcjNLUO
  VfMYpzMCoJ86qCXMKTmVcCt+kV0BFMQEf0HEsHOaIkESEl1cA0u+3Qn90mL+6w1kr2X317P2r
  Ot3+eRV6fVmkdqr9xPO5SXpHOrs9LCp7ucVvaYPnna9nFcK7Z61++FWvia9VdYPit8/iUf6/m
  yvj8skp5J/kyq7H/+J4JPv41wd+tY75n53e8a71bkMnidFr6bW1C4rQpH4KfnyvIkz+6cbeXi
  3+N+KPnJw0NCmseOdQ7ijwrW+IWf7n3bQhX/PVkv6X+0aybV295t3ZPodTifdobm5I/Fu2sqB
  H9JPAs+RKD7vf3QdeixOeUhrPLGzrUilzvPjLp7wGBpKM3lFQWXOjpsfiwQa76Lc9l5uXT3cv
  vO7PsLVCaeJX/aRxX6zOPX2efnm08VfC83N69bk7Xwq3PlViKMxINtZiLihMBytCDiU0EAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-34.tower-223.messagelabs.com!1584033995!1166492!1
X-Originating-IP: [104.47.17.110]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6615 invoked from network); 12 Mar 2020 17:26:36 -0000
Received: from mail-db8eur05lp2110.outbound.protection.outlook.com (HELO EUR05-DB8-obe.outbound.protection.outlook.com) (104.47.17.110)
  by server-34.tower-223.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2020 17:26:36 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMTd47MyX6NWBHwf8EFR4uA/XmZlC3G2jKWlwD0nhz7c1xXzzC+0Q4fzZkcWWqF0XKc9E130Vbcmb0DsStuXRTfTudSW3v+9ry97LQy0zOQf5ckxRMPahAcNBrZCXIUHYzw3jimie1KO6gGSfviwEkWUc6PEMcPk7tszMAje9MMxfkY8fOx8oXoN/1XikhUXaL6nWsDDxlqppTRFVq7owTC5V/C3khLyCPg95JhGrk5nn+9sEwIKii1AFU9r3Ja8pk+Gel+v5OwF2kQK2tS/eyieC+F94T0eG9uZt3ikAi5TunPuFHZmlCF6ogzgi4VLBzU/qb0Ug5luI1H2M0tDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlfdtt+M6wJwWJyC5FYGMurUm0RG7qWdTOoj/kjTdv4=;
 b=EirOgXmhwlnB5mHj+8z+jz9hZYjvvbUIfdYzlStJRomlAmnbbaaaPvmcO2SFzPZZZm0GgxF2yygu4V24LRrhOAERrvxgYLlEs3zHfCYVl0RHAG8B8Njdvbcj+MC4xXgf9qmsOLz7F44i+DGs9gpZEJmE4m+h9tTr5DeKK2rn0bTJtHJoMwKW/TVyhk1SweTDmo6CGGmhzyN30Wn5kipiiUvdUGCgwarIkurZgFpumly93Ty30v4WAQYE5P+2iVpHIA2EFkrQF2gaO/wH0Fp3zHKTPExwWDeOPv1NgYJPeAxOUzHbCGS8DkFrPpm4sKys+xii5h4MsBMiNEQqZxWjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlfdtt+M6wJwWJyC5FYGMurUm0RG7qWdTOoj/kjTdv4=;
 b=XLl3fT9gxhKUsUCKSSYRq0AxbGpCYAnvPtYZq6Xl1ZftNA2m/jA1BHoG3BtaXZ4KClgCDe1nw/lWZ+A7K2dLbsgMS3skRtkDMf3s/wUNgddBj5JtskSAcX1uRmVGfQCo289F8HH6pNPucZ7235pV4mayc0pIAxXXXchI2w/wv94=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2102.EURPRD10.PROD.OUTLOOK.COM (52.134.119.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Thu, 12 Mar 2020 17:26:34 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 17:26:34 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] rtc: da9052: switch to
 rtc_time64_to_tm/rtc_tm_to_time64
Thread-Topic: [PATCH 3/3] rtc: da9052: switch to
 rtc_time64_to_tm/rtc_tm_to_time64
Thread-Index: AQHV84nhlRD8us384ESTd/Ktds7sn6hFPOVA
Date:   Thu, 12 Mar 2020 17:26:34 +0000
Message-ID: <AM6PR10MB2263BC940E01C0B800C5A7F580FD0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200306073548.57579-1-alexandre.belloni@bootlin.com>
 <20200306073548.57579-3-alexandre.belloni@bootlin.com>
In-Reply-To: <20200306073548.57579-3-alexandre.belloni@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a16c208-506d-4250-0758-08d7c6aa834e
x-ms-traffictypediagnostic: AM6PR10MB2102:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB21029D933F1A0C4D55E183BAA7FD0@AM6PR10MB2102.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(76116006)(66946007)(7696005)(86362001)(66476007)(8936002)(53546011)(66556008)(66446008)(64756008)(4744005)(52536014)(4326008)(55016002)(110136005)(5660300002)(316002)(81156014)(6506007)(9686003)(186003)(81166006)(8676002)(54906003)(478600001)(33656002)(26005)(71200400001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2102;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mKGJpkYVjSyZcyylJsEv91/tNu8J6uX0gq5N6Qmiz6PUsQ9/AqZqvxK+OCkqVZ4qz470ba16LsTwiQu3dstpNx/0G6MczagMybKxz7mlPhmhU4mh/uTY6tnaXbQXV5Aty1+C3HPre+JZMEp3wPEFadv5NjWF7TIXWrh2OYpX3FgR57fqgkZSZvJTkLPeJIFuZVRzTKC7rM+rcnCOmBqvTPuqQ3lcUY0CwWvUwd7eM53insNgP8qOI/7eqCFZaEc7DSsdZ8LkFxlCZA4+t2U7y++K6Xo1MUIVr/v58B6r7bXsONfBFKeQ1fH2iRicXalX5PohbzeUoykVLvbgZFMAIv3B2Nx+xyNXGC7EFqsl9Kt56FhvtKyPeR6o8V3E6ZGc7QhcShGPm8lDcA2/AO/+2R1sfRT3yQqf+9bVpm5jfAxw53tVXpF5p47RNKGjWvyg
x-ms-exchange-antispam-messagedata: b38luXmwdn/oWbQf6B55clh/+kF95W2iUWAU0DBJ6w4rEHs8o1qvEao6p/D/Hg2TXcsP9s+W2qmdX7dobdRjKMRLYe7yYjldLjpi37EyD6Q1k1kpKvn+OqYPgJlYUNz9K6/NkZsx7E4eC3stT+AiKw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a16c208-506d-4250-0758-08d7c6aa834e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 17:26:34.5093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPWXwUFUbXtK7DQqdti/bDa5ZzUoWSJETrBV9NAu7KU0m5XyoIxnzEbUQHZVNSJCt/8gqqLWjbDqaNdqyQC7IjVFqf3UhpZL+HXJd0VrEW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2102
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06 March 2020 07:36, Alexandre Belloni wrote:

> Call the 64bit versions of rtc_tm time conversion.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  drivers/rtc/rtc-da9052.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
> index 27cde834a1b8..1c567f86ee30 100644
> --- a/drivers/rtc/rtc-da9052.c
> +++ b/drivers/rtc/rtc-da9052.c
> @@ -103,13 +103,11 @@ static int da9052_set_alarm(struct da9052_rtc *rtc,
> struct rtc_time *rtc_tm)
>  	int ret;
>  	uint8_t v[3];
>=20
> -	ret =3D rtc_tm_to_time(rtc_tm, &alm_time);
> -	if (ret !=3D 0)
> -		return ret;
> +	alm_time =3D rtc_tm_to_time64(rtc_tm);
>=20
>  	if (rtc_tm->tm_sec > 0) {
>  		alm_time +=3D 60 - rtc_tm->tm_sec;
> -		rtc_time_to_tm(alm_time, rtc_tm);
> +		rtc_time64_to_tm(alm_time, rtc_tm);
>  	}
>  	BUG_ON(rtc_tm->tm_sec); /* it will cause repeated irqs if not zero */
>=20
> --
> 2.24.1

