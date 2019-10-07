Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75597CDF7E
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 12:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfJGKlE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 06:41:04 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.5]:57798 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727252AbfJGKlE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 06:41:04 -0400
Received: from [85.158.142.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 52/BA-25221-C361B9D5; Mon, 07 Oct 2019 10:41:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGJsWRWlGSWpSXmKPExsWSoc9hqmsjNjv
  W4PktZYslF6+yW7S/W8Zucf78BnaLy7vmsFkcW32FzYHVY96aao9NqzrZPKbP+8nk8XmTXABL
  FGtmXlJ+RQJrxuevG5kLpnNWfD0+ja2B8QF7FyMXB6PAUmaJM//+skI4x1gk3s+bA+VsZpT43
  fuTDcRhETjBLLHw8DlGEEdIYCqTxN/ty5ggnAeMEh8erwdyODnYBCwkJp94ANYiIrCNSeL46W
  6gNRwcwgJBEr9XsILUiAgESxz/9YENwjaS+DH7J1gvi4CKxKuWnWA2r0CixOkfp9hBbCEBY4m
  bF1eygNicAiYSzdvegtmMArISXxpXM4PYzALiEreezAfrlRAQkFiy5zwzhC0q8fLxP1aI+lSJ
  k003GCHiOhJnrz+BspUk5s09AmXLSlya3w1l+0o0dcyAq3/y9DUrhG0hsaS7lQXkLQmgm/8dq
  oQIF0jsO38J6gQ1ic9Pr0CdICNx+8F8cFhJCHxileg6dIQJ4q9kiQ9zz7JPYNSbheQFCFtHYs
  HuT2wQtrbEsoWvmWeBg0VQ4uTMJywLGFlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrGukamhvrJVb
  pJuqlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxApNUSiHT2h2M82e90TvEKMnBpCTKK7dr
  VqwQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5torNjhQSLUtNTK9Iyc4AJEyYtwcGjJMI7QwQoz
  VtckJhbnJkOkTrFqMsx4eXcRcxCLHn5ealS4rwLQYoEQIoySvPgRsCS9yVGWSlhXkYGBgYhno
  LUotzMElT5V4ziHIxKwrwHQS7hycwrgdv0CugIJqAj/vhNBzmiJBEhJdXAZJ949ODjhfK+M2V
  erxH93T31cNttUb6WrkahtccueuyamMRXqT6Tjy/+dkfP/JuKOaeUkjhf/wiTLNx6nv+UJjuP
  rZDIHEd3lcjyq9I1dayXbrdE8Z/ov/dgblH1exmLG2dqL8ZpcN5dptzeezy1ujNj4axZux891
  Fr6aEPwodc56cn1n+Z2fJZOCL6Tf78pOmHHb7kbOTVWkcu860yuHtzb0ubc6ym6f863x0vOqJ
  9Ld83bN89vk+HyGo8Nv6s2JczWO7nzb34LF1uY053p0gfdW7rXxzwIN/7YGqGwb8r6eXWVW69
  Hmc45bau3wYC911lROGMff8ylikcbjkd+X8CZm/hSYRKbX/aFTZerlFiKMxINtZiLihMBSXi/
  flkEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-37.tower-223.messagelabs.com!1570444860!450918!1
X-Originating-IP: [104.47.8.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23305 invoked from network); 7 Oct 2019 10:41:00 -0000
Received: from mail-am5eur03lp2053.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.53)
  by server-37.tower-223.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 7 Oct 2019 10:41:00 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogZpz9Xvc7qNxsyqRa4ZblWN5+cru50tVDmkEPjFu7PH4mzrf/B12BU/2AC9tMb5pNJ4haHYmQQxdGL2ekwyS6ZvCup29nEETuXvun+Cba+SONYg6Nkrth4Kw/kb3GpkuMxoHIHPLWm+jUMr2k20cjTBwkyb2qa/yMkKrrtbsl3S97qfYaRIy1513DauL7AUtclUHa6HoQicyELp0L3mtlICaJ3tWdLyOPf8545xHCv/Ooxd9G8avwccRPUS0fKmxb/sDLMmYLwCb/bHy1qE2MnAvm9LhSXGTCbWyKe+nMfsk20qtOnL0G6Z6pRivxCJnGw9j3Vn7twNNBkrl11W4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXRmAz7jfIpWt7FSeWwc+BpSBtMWCjSaVjjjpMfxYJ8=;
 b=eRVD2Tc7aPIvYQs4iEhq+vEztaZc+3h9q/e8vjsovHqcvYUcMhrdXkygSLrH042zknNgg0UeADsUXYTIZoyouv995gc3jeYNWSpJcxwwJpT0Dh11EFAUiBHfNjeK/k1MfnbAiGqRv3XnLisItoWxNp451ysxa7zYcHWyvVmYAHSHavdMnxMRWr2c7MV5prwTmG6gW2cem+qyRjN64sfsTmD+KtYBf0jGxlYBYjmhGFSWScQZhMr/eccb/eZp/8Sv6aBGoFNj0T6vYdoWKGxpEzAf9a8m7ksrtxuNr/XNt3BSGeQplnnwvN1b5sN7NXaN/fQpOIJuo9UTE+hKZPkzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXRmAz7jfIpWt7FSeWwc+BpSBtMWCjSaVjjjpMfxYJ8=;
 b=woXr5Di4qJPQCF8R9LwdEj1D4EOBXJRyUD4oU7tl6scz9mCA16iPenxWC1EF8lEMOtNtHk7cnr2EUxYNHrS6HoOIedlefhA3wQFGzNt0sv9i9eUnFcakAaSnW2v40YKG8ZlFQj3dHzEUGt3a1AQqLz1S1it39s6qf4vMLs0TWfs=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0964.EURPRD10.PROD.OUTLOOK.COM (10.169.154.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 10:40:59 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b7:8cda:1411:fb7f]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b7:8cda:1411:fb7f%8]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 10:40:59 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFT] rtc: da9063: Handle invalid IRQ from
 platform_get_irq_byname()
Thread-Topic: [RFT] rtc: da9063: Handle invalid IRQ from
 platform_get_irq_byname()
Thread-Index: AQHVesUmwHhyUR6VC0mId+ZO0qCfyKdPAIIQ
Date:   Mon, 7 Oct 2019 10:40:59 +0000
Message-ID: <AM5PR1001MB0994628BB79E451FB8BEDC07809B0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191004150510.6278-1-krzk@kernel.org>
In-Reply-To: <20191004150510.6278-1-krzk@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1524afa-fe14-416a-d5c7-08d74b12d78c
x-ms-traffictypediagnostic: AM5PR1001MB0964:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB096483523ED3716CE9EF4B10A79B0@AM5PR1001MB0964.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(199004)(189003)(6246003)(14444005)(71200400001)(5660300002)(478600001)(9686003)(71190400001)(8936002)(2201001)(256004)(316002)(64756008)(66446008)(66556008)(86362001)(305945005)(66476007)(76116006)(66946007)(33656002)(2501003)(14454004)(7736002)(25786009)(74316002)(110136005)(186003)(26005)(3846002)(53546011)(6116002)(76176011)(55236004)(229853002)(6506007)(102836004)(66066001)(2906002)(11346002)(446003)(476003)(486006)(6436002)(99286004)(55016002)(81166006)(52536014)(81156014)(8676002)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB0964;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2spJUou9dAWwySrh5Z/gsr2LiUIHO9Z2MTI/gaGtE9yMYe2lXsCbllqNefo/OxhdFiQueaMg3c6YEhk622SI6slcw/KM75U7tft365jeeWZeEHZOnDblEI4hTexXytIbUU/G0VcmBu1fsoDVFo4r0u/nueaeSZrkBWjCnD267lchGZDFDrKwDbIejJJMQIe/+oIZidJkApjnlfyAkcqVNwfSrgvkRJNMzV+WlrSea0c4v38fs8dz60YO6pq17UHna4VbzhUSlX9oxJYmm3D/z6kzAS8EM6QXT+DZUGCvMx1DQoxfbE7eC57QYS3Iqdzq0vxXo7ssZ8VBJqlt3Idpg62Ax4rzx+Fih3C0v1Wizy5GXw+nE0EnMZESrZKC3nnjHe2Zxm1llOI70sQIhFM6SFEJhZF4ycjQCEepCIbFbjs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1524afa-fe14-416a-d5c7-08d74b12d78c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 10:40:59.2401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWo/0WcvBkqSz9Jd89l8DIgIBx5S1ZjzAHum/60CqfGzeZZ2GNOTN3k6ZFQBpBzs2nxCnLq3HeQj9uYl//28eb7CA2OrTK+xtU7p37GxHoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0964
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04 October 2019 16:05, Krzysztof Kozlowski wrote:

> platform_get_irq_byname() might return -errno which later would be
> cast to an unsigned int and used in request_irq().
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This doesn't break the existing RTC functionality when running up on my tes=
t
board with DA9063. Although very unlikely to occur it does make sense so:

Tested-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>=20
> ---
>=20
> Not marking as cc-stable as this was not reproduced and not tested.
> ---
>  drivers/rtc/rtc-da9063.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
> index 15908d51b1cb..046b1d4c3dae 100644
> --- a/drivers/rtc/rtc-da9063.c
> +++ b/drivers/rtc/rtc-da9063.c
> @@ -483,6 +483,9 @@ static int da9063_rtc_probe(struct platform_device
> *pdev)
>  		rtc->rtc_dev->uie_unsupported =3D 1;
>=20
>  	irq_alarm =3D platform_get_irq_byname(pdev, "ALARM");
> +	if (irq_alarm < 0)
> +		return irq_alarm;
> +
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
>  					da9063_alarm_event,
>  					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> --
