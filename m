Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2186A0F4
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2019 05:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730409AbfGPDt2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jul 2019 23:49:28 -0400
Received: from mail-eopbgr10087.outbound.protection.outlook.com ([40.107.1.87]:51502
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727862AbfGPDt1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 15 Jul 2019 23:49:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcLakkmgmcE+Df/tF6PLrMlx5ndaK7pMG74Z1KlF/Atr+IYliyIkQ99dsLy7WBgqPLR/qic3bil8ULNJCbgf83XX4lgMdlsPaVRstkmq19lsXUDxGWyN6kwejaR6e/hh7xcEB61YUveOCW9a71ow0ijMKE/gjfL93NZQ+3ATPd3FGHve/klp7orZRLvf0IQjqleUipP+cOcU6rG7jL39wW89Lqz3Jom6+kksg3/9ZZjoWIbMi4uQ1W41kCCPnzG8vQph97r4QzBll1UpWnV0yhBEsyufWLpla84qHHbxq6XvhwCvD8gzeaiwlTbev1jv7nf00xrTK4yRWiExBTIGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGnTzuQQQrAqq+ifg6DXn9NOtrbSQwkg5aToUensWvw=;
 b=b1tAJvuJgtUkxClPIj5mms0lBrkgNh3mE1qO/oObnX2GRXQM43EdqHyPB/35EC5C897QiaeaTPUFzDI5j7GC+dh5QVFfI3QbxV4Ci/gSj1mMIVkXOf8F3fkDsEcR9xSwro3dHXno1qfVSUGyeqE8q7trQu5i7YsBsaqn+j9adRW/BPitqsENE84LuJAcAyqcTDvrTVFRU21DGr4/fLiiH+OcFbal/IDXbgqen6s2eBHGf0i9wwwev6JThiW/FfnWYY4uZhm+5ZUc9nZmsdEJLKNa88iwLEOvRdySUO37ZiGEdPVz4FvaWkQiOG+BR2rnNYahO8pGWITyDhugU2mShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGnTzuQQQrAqq+ifg6DXn9NOtrbSQwkg5aToUensWvw=;
 b=dcP+2NPy6dO8S6QdLmr3iXDpsSzQYPX1RyvRAYn3isDRHd2sqZfTGEeptMJMW3xT9yKlJLqqFRWkMv/nk5bamxlDUbJ0soncopVe0SQ8rnXUpMY+tj1eD4dA/D69yFk1CsksO1Tr5tlx9iClocnhkZSHpd+r1+SDsAgaNGRmg3Y=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5097.eurprd04.prod.outlook.com (20.176.233.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 03:49:23 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd%5]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 03:49:23 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v4,1/2] rtc/fsl: add FTM alarm driver as the wakeup
 source
Thread-Topic: [EXT] Re: [v4,1/2] rtc/fsl: add FTM alarm driver as the wakeup
 source
Thread-Index: AQHVOveTDIFqnCscBkeBgotIifHzIabLxRGAgADU0CA=
Date:   Tue, 16 Jul 2019 03:49:22 +0000
Message-ID: <DB7PR04MB449094EC27851F3DE0BA5BA08FCE0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190715101520.22562-1-biwen.li@nxp.com>
 <20190715145637.GG4732@piout.net>
In-Reply-To: <20190715145637.GG4732@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2af4248-ea13-4734-aa41-08d709a09717
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB5097;
x-ms-traffictypediagnostic: DB7PR04MB5097:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB7PR04MB50977395E3D4408D8ED5B92A8FCE0@DB7PR04MB5097.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(189003)(199004)(66946007)(76176011)(3846002)(66556008)(66066001)(66446008)(64756008)(66476007)(8936002)(4744005)(44832011)(6306002)(102836004)(55016002)(8676002)(76116006)(7696005)(476003)(186003)(478600001)(6116002)(26005)(6506007)(68736007)(14454004)(9686003)(45080400002)(81156014)(6436002)(81166006)(53936002)(305945005)(71200400001)(256004)(99286004)(2906002)(7736002)(71190400001)(74316002)(6246003)(52536014)(446003)(54906003)(11346002)(966005)(486006)(4326008)(6916009)(86362001)(316002)(33656002)(229853002)(5660300002)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5097;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bvdGRNXV5Ks93xZE9Qyql0JuQXgrzZH7mJpatu7WHpSkuJz7ZdBGZZp3pv6vDndewlRqcsTPKH0cE8w+/1kxCUnwAL5BEcsa+mDAknDIn5Hgf4gn8SZ95uKpjWeNxHYBSrBOrx1feQCjyBs7UXtnqtAAb4jXIMbT9t6UH7InmX/CmSBN+/17gAqcaNVpRaAL4a9C2TYgVEmvckP+qZ9LxWncGF1C/XLk7tyoq+G52QJDmGIlTxJ7paG24isERPBxAbdgNooB0Die1J6//A1ARSGOY3HfMOGs1DyyjqNL1DOxDIfCHG3fc9sVfyWDGmR6LUwfksweD4PDy9xESez/+VGFNkaQ4ZHhbClldobxaSwMm4QjQEKJ9t+kdW9zhpa51pawMT3/pjonSYNBtY6Ht3DCh1/+Q3tMUuKl0hBxkMA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2af4248-ea13-4734-aa41-08d709a09717
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 03:49:22.9443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biwen.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5097
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

> Caution: EXT Email
>=20
> On 15/07/2019 18:15:19+0800, Biwen Li wrote:
> > +     device_init_wakeup(&pdev->dev, true);
> > +     rtc->rtc_dev =3D devm_rtc_device_register(&pdev->dev, "ftm-alarm"=
,
> > +
> &ftm_rtc_ops,
> > +
> THIS_MODULE);
>=20
> To be clear, I want you to not use devm_rtc_device_register and use
> devm_rtc_allocate_device and rtc_register_device.
I will correct it in v5.
>=20
> > +     if (IS_ERR(rtc->rtc_dev)) {
> > +             dev_err(&pdev->dev, "can't register rtc device\n");
> > +             return PTR_ERR(rtc->rtc_dev);
> > +     }
> > +
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7Cc5b1382ed1fb493cf69
> f08d7093513b2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 6987995881848030&amp;sdata=3DT71z2Rjw%2FZL444U8C1ow3WcoyDYl76Mq
> niLIupXbXtI%3D&amp;reserved=3D0
