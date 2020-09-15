Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F4F26A339
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 12:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgIOKfV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 06:35:21 -0400
Received: from mail-eopbgr10069.outbound.protection.outlook.com ([40.107.1.69]:26216
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726119AbgIOKfU (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 15 Sep 2020 06:35:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUlQxQ25FpE8xkc7fiO7RoLkLTYDRq06RO7VrJkap9eEgR1Gs/yLtvtR74zGlSEwDOmXVSIzXPfJZCbs4J8o+ChF2f9dtG7PN5emBcqmEiDtIm4JqVacJXHQ/nravRKFlM1sC4p32tSOn+8RtAjcYdL5ngKkaItiJmwdsaDNHzvS2pR+dUkGAJumuc+9G5vOGiwb0ERnsTOAoxxBsrdIlPKGz0eDCIgg2mDLJ3b/n778AEyH4bmpZpY1HkGWJSGCG+yPIooVaL3ZGEbQ8KgW0LshijBLWqfS9wuKf05sE8pxPG8gp8t0nRbtWLRjASqM7xz5ui03gB3rQNdKG4p1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjBe/h0c47ERfPziAe+0LWgPJQGA8sCLnk2JNwT+3FQ=;
 b=N5M3nToClo14PZACGymtPqkqj3Z5IOILy0FEQfVu7JU4cA11+q7i7aBhelQAKAoNlUK6iQ64MMBZ+1TwPS7pqrw4thfu5nSGzzcXxUplN9Mou4VKU3GeVQRxRU3EKwY0APDCUYBy2dN4nk1IrcXd8Ym03LzOfvAK7fqtlsa63t99YT7WnFnu0o1d01PgPfbLKYYx0FvgClgSVMYal9fJZeoJ02lNziB8bb5y9SPoYUsF9UwOFAgwl9mhAP2K6h74KAqKdSPrRTTq0W2m35e4mA06amyrGPcU9vu9q7TDZSvVAixg6plgRhDM9tozJ0D6Lg8KY7K3IsLD1tZXhG59xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjBe/h0c47ERfPziAe+0LWgPJQGA8sCLnk2JNwT+3FQ=;
 b=lapsbywOO3FG5JCqpPr/aQ6Lt8mut2r6itB4v0QUbp+9460DhwQkcqJR52B0K6waQhIIvvv86HgDZQrvcdMQThDZ7SINhM74H11I7rW/9hsgxFh3etbitlPXYj9nz+Yst+dN+vdRQLY9HDEUpUyj7xBHLEfpfk5oPDlheRqiItA=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB7PR04MB5292.eurprd04.prod.outlook.com (2603:10a6:10:1f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 10:35:12 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::c8a:a759:d4ba:181e]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::c8a:a759:d4ba:181e%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 10:35:12 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     Leo Li <leoyang.li@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>
Subject: RE: [EXT] Re: rtc: fsl-ftm-alarm: add shutdown interface
Thread-Topic: [EXT] Re: rtc: fsl-ftm-alarm: add shutdown interface
Thread-Index: AQHWBo7q7oogBWYJ/0Ch/nk6xakViKhhV7UAgQkxBoCAAAFUcA==
Date:   Tue, 15 Sep 2020 10:35:12 +0000
Message-ID: <DB6PR0401MB24385907880BAA626E5909528F200@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200330122616.24044-1-biwen.li@oss.nxp.com>
 <20200330164400.GE846876@piout.net> <20200915102817.GL4230@piout.net>
In-Reply-To: <20200915102817.GL4230@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 168cd5df-874f-4afc-a9da-08d8596306d8
x-ms-traffictypediagnostic: DB7PR04MB5292:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5292E5BA38EB04BDDB8734F78F200@DB7PR04MB5292.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IfK6AtZ6+R+/9xYKdYTKIGDpTTuFs7Kh5ZLUVHk8qqn6wZ1X/lk0to+suc2IpcVcouUWayxcJfs6jBNWNlNPP+SbYepi1QqCd0yQBT+ylzbY6t2vB2ZqQhr1uqW3VHiQkewlfiNPqJSQfoxQwYOXLvCQ9gQg9ZTozmed6C1y3XRRpzOKN8JhfE0mZ1Gb79OXPTvBZdyyfAeEa7Y0TzCF99yDGPjMz1h+fiPLNWRRGUsCtcQgQsYqPAAhxem4ze6WOcgTvcn8+cgI0aSxWOKHeOJ6vAQrPj4muF9nsA9dfwtD3gW+FCUWdL5vqhKbC1/42vqAg44M6fUOb5VJtAY4q3ObJNVKvPSTbdpifWnX5x0SPruHvu2uUStPBMhYt+Gl1J+xrhYpSDDi3UPy0EeyBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(55016002)(186003)(66446008)(110136005)(66476007)(66946007)(66556008)(26005)(64756008)(76116006)(478600001)(52536014)(7696005)(54906003)(6506007)(8936002)(8676002)(4326008)(2906002)(33656002)(44832011)(45080400002)(5660300002)(86362001)(71200400001)(9686003)(316002)(83080400001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9+bxqMz2GssKhYTFlSyOdex3IaEt859i76pjtXZNkKdB1CUF/xP2/kZ3g/zrSU4IWhbLiBn1XY1Umf9sMvADZxxGtsPfsoxoJQ4HZ68zj/IGg1aNR9UaRX8YxCwxK38Ogc8zVuAXmqSzGtQz43VcujuMjIXZxlQn4iEwmSGZQzzJziR3W7VWNHsDMXkDF5s0xmvIAx2kqYHHCIfWbYgdjqW6rE4wTDfQGdFsU0DemG0P9Cl1N4WlpUsXPKu48J1i5XvcKP6f8p3TzI8oWz40up8X6QGHqG/Bmc8Hn+0bxc2WAee8XKMZKMuMBAo86EmJKygH2t20oPsO86ixVgCamDK3FbrwOcSgLqEhLdROg7lViOptrIl5qglo8zUaAihLB8WLafUAGqzc7CV5gTi3Wf1Kpik/DSijoG7LTgaAgcksCoYLTEk/b1sbPDOAl1k0Hoe3SWjpTvSeBN5b3VBSX7FViBDFWHucJVbFhiKn20OrcIlBSQnu6Yo9c0S7tum3thwY3sgxXkAhYQoUY5Umzkv2scITphevBIoS85Iaffo2qm8ZGzeROeDZPLkiEgBQ9eqXAI7Az+R4MLtKy7vVGygOfc5jidm1kOF4aUiOEE2qDvVq+aL75dMi2/PMMEl81+uD2y6asPlyOZmBmI117Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168cd5df-874f-4afc-a9da-08d8596306d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 10:35:12.3092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xplV1hBWvij1QQ4ppFPxSz9e2AWTVzRHMp1F/sTn3w7s4W7K9EhEEkEA1ClW/HkPr4IlCkRSdGSmxzC7TWaTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5292
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> Hi,
>=20
> On 30/03/2020 18:44:01+0200, Alexandre Belloni wrote:
> > On 30/03/2020 20:26:16+0800, Biwen Li wrote:
> > > From: Biwen Li <biwen.li@nxp.com>
> > >
> > > Add shutdown interface
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > >  drivers/rtc/rtc-fsl-ftm-alarm.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > b/drivers/rtc/rtc-fsl-ftm-alarm.c index d7fa6c16f47b..118a775e8316
> > > 100644
> > > --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > > @@ -307,6 +307,15 @@ static int ftm_rtc_probe(struct platform_device
> *pdev)
> > >     return 0;
> > >  }
> > >
> > > +static void ftm_rtc_shutdown(struct platform_device *pdev) {
> > > +   struct ftm_rtc *rtc =3D platform_get_drvdata(pdev);
> > > +
> > > +   ftm_irq_acknowledge(rtc);
> > > +   ftm_irq_disable(rtc);
> > > +   ftm_clean_alarm(rtc);
> >
> > If the alarm is able to start the platform, then you probably don't
> > want to disable the alarm on shutdown.
> >
>=20
> I realise you never replied to that question. Is that patch still of inte=
rest?
Hi Alex, you can drop it. Thanks.
Best Regards,
Biwen Li
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.c
> om%2F&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7Cd688030894714bca7
> 5c708d8596210ec%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 7357625013809281&amp;sdata=3DpOBMmsxi7DVlywuLZ2LOLVgK4r4GtvW1PYq1
> p9JVv74%3D&amp;reserved=3D0
