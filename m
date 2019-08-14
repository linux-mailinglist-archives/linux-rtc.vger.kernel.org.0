Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDEFD8DD1D
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 20:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbfHNSjZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 14:39:25 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:43243
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728265AbfHNSjZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 14 Aug 2019 14:39:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edQkbxPoffE9Yf9r28GSlPa3FX0hZhGMUHP40BVJ3Do1iBJ/6N01IqEFXI+leVKpt6Cp8EZ8n8Y3b2E+wNtt0O0oz/syBTNq7Jt7Q22MT95PZdCPPPZCmpBJ6T1trIVVK8HCZl4fKBCbJd6IUy/kLfz7QMQtS8l+UuZyBKo6B45VfFbcvAdTCl1r8+UJAYoQUvQw/xQe00Q5+m9Ny/O2LlMOrmaOh9PguJnz1kUsyGZpnHUSoItSodx6kczIRsxq9gjJiOiHUNE83Cb5HEyCtDyd7ExEDzjeXHeBoS6Caaaqi7PWBvEHivfs+Pg3DPxjP/AAv+VwzS6Kyo9HeK0dfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO3sMAuPEHkj0Mg78rkUrCp90JkoFPDil+gcBsix7+M=;
 b=RsHt2nNxhEyhjEegoz/MqgjHJOl1srPpR1CgPQQej/0uovfU58KoYn1VFpj3WbaiWHcoJNUNPkpSlHDZGWUKF9JbG6StWNbAtd/gbAmG0qT0OAFapH/cKYphw90w5oawJHJT/bKXW+H1KzrGYkbyI96tDvTcBJgw9OhjztgpCn+21DvExSj2zm1XwNN5lwZcJPxmEed8M1VDmP1Xe6mPM0j0ETy61YO2n2z4ZZqc12smHPv6Jxnu/5ufC7Kc+S+BnfaJ24/WJ2uiByUm6B7iMxWz2LMpOLU2M2LD7Z0y1RLP+p+lSadMG5Xs6cBwudJNpAuhfWk+kfGjIzsPsz++Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO3sMAuPEHkj0Mg78rkUrCp90JkoFPDil+gcBsix7+M=;
 b=llknmLdk3gpjtWJVT9nWPWLxqdDu+D4cEgTp8569eSfLbOWopmRHeYcc2WsjXbOlIZwMjpGY+q7i5MVKyy2TLkUzJY338oMiw5qKbs1cwai6MnbfdpZiErXk835heik0C5wzlOUq+f08XgWXbXsK2w8wgNU/BLVSrINlN5X200A=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.233.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Wed, 14 Aug 2019 18:39:22 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3c54:f415:644a:15f9]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3c54:f415:644a:15f9%6]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 18:39:22 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Biwen Li <biwen.li@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Biwen Li <biwen.li@nxp.com>
Subject: RE: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Topic: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Thread-Index: AQHVUoSffVMVL9pU8EWFzlDe9z+sGab6+TgA
Date:   Wed, 14 Aug 2019 18:39:21 +0000
Message-ID: <VE1PR04MB66875AF7A38BF43351970EB08FAD0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190814093249.40065-1-biwen.li@nxp.com>
In-Reply-To: <20190814093249.40065-1-biwen.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a85afa11-22ae-4738-050f-08d720e6b956
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VE1PR04MB6528;
x-ms-traffictypediagnostic: VE1PR04MB6528:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6528A8839132F56DE1D479718FAD0@VE1PR04MB6528.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:173;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(199004)(13464003)(189003)(33656002)(2906002)(53546011)(74316002)(186003)(7696005)(305945005)(102836004)(76176011)(3846002)(2201001)(256004)(14444005)(26005)(6116002)(8676002)(6506007)(14454004)(7736002)(478600001)(99286004)(66556008)(64756008)(66446008)(66946007)(76116006)(2501003)(66476007)(229853002)(55016002)(66066001)(486006)(53936002)(6246003)(476003)(9686003)(446003)(11346002)(86362001)(25786009)(4326008)(8936002)(54906003)(6436002)(5660300002)(316002)(81166006)(52536014)(81156014)(110136005)(71200400001)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6528;H:VE1PR04MB6687.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C27LusnSx3clJ3ay/LteVsCY5vKYcDsuAtFxsZDxOQOC1T1l0Yc/0vmnMAtGJxkfJzi1oVJzQBE+bbrvU/A2uk9ei8WZZTPv/C1KF7+lHdeoohVxLyssRZ47ZIC2zBYAw6cxR7SYLLj2GxKUQqBdhK9Z1EtERKX63tNSfo//pBKpL15noUzwIGGG5U1D10ZK0X8WmPseCGdrA9m8m6uLGsW3pD0VGw0QDVRNEZsZq2w/ZlRhpqGhN35PtcpfPOsRgUGDoUQpOT64wwbx046TcEdACIGzq/vwWVhL6aiB5NMHEvAYk3RF22vl7Y0eDXbcwGh1jEWlEefAlXjhclENmQb1pp4LdrK2IqnRZ3/p/j7kOkH8krUtwXSLYHPIQMwvtfRBqVUCOsAm6/F68Lzgd4u3Ch354q3/x9s+uLtEn8o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85afa11-22ae-4738-050f-08d720e6b956
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 18:39:21.8674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uo+vwiIjnFACa4A46uYeO6PQBpNwAHvKHJZ00EmbcmMYNQn7jUxDxVbrCISvQW7PNr3P5rpv2xqeHNFuJpeECA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6528
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



> -----Original Message-----
> From: Biwen Li <biwen.li@nxp.com>
> Sent: Wednesday, August 14, 2019 4:33 AM
> To: a.zummo@towertech.it; alexandre.belloni@bootlin.com; Leo Li
> <leoyang.li@nxp.com>
> Cc: linux-rtc@vger.kernel.org; linux-kernel@vger.kernel.org; Biwen Li
> <biwen.li@nxp.com>
> Subject: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
>=20
> Issue:
>     # hwclock -w
>     hwclock: RTC_SET_TIME: Invalid argument
>=20
> The patch fixes error when run command hwclock -w
> with rtc pcf85363/pcf85263

Can you explain a little bit more in the commit message on how the changes =
fix the above issue?   It is not that clear just from the code.

>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-pcf85363.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
> index a075e77617dc..3450d615974d 100644
> --- a/drivers/rtc/rtc-pcf85363.c
> +++ b/drivers/rtc/rtc-pcf85363.c
> @@ -166,7 +166,12 @@ static int pcf85363_rtc_set_time(struct device *dev,
> struct rtc_time *tm)
>  	buf[DT_YEARS] =3D bin2bcd(tm->tm_year % 100);
>=20
>  	ret =3D regmap_bulk_write(pcf85363->regmap, CTRL_STOP_EN,
> -				tmp, sizeof(tmp));
> +				tmp, 2);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_bulk_write(pcf85363->regmap, DT_100THS,
> +				buf, sizeof(tmp) - 2);
>  	if (ret)
>  		return ret;
>=20
> --
> 2.17.1

