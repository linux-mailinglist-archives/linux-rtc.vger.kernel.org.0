Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21CC45A5EC
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Nov 2021 15:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238322AbhKWOk4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Nov 2021 09:40:56 -0500
Received: from mail-db8eur05on2085.outbound.protection.outlook.com ([40.107.20.85]:65345
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238276AbhKWOkz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 23 Nov 2021 09:40:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3GcvX+8SY4hZxEdZ2qemRxSTAai2yUfMTz+4DYCV0E7WLDjG6NYKT3epjtFsGkb6qq5t2sM8emZCvzKJ5C9829RVnU0x2qcJkVNhWgGY4c3rFgckyxG+ajxSylvA+a+zLU/iexlF1WEJoKLs020Pt1Hj/erNfzdEz5qi53IcQnyED4XAT330oHCzBZHcq00CY1Ondz12TsdVKRIOBUOBv/DuVBCDD+kaUjavGGxgN02f9FMWRofBPqI34OAL+oFKuGtButV2yaSDgmeX7Utgvzfv5gswaPyloUJbQj8HIQx9eGOsNdlYfuAm3X0jPZeavYeIKy4K85VLGtwVBt+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocjDgRabWK8tQpgsw9UAdN4+S/Fh3fNx6J5P7xLcT/0=;
 b=CX0TDtDPF2SsLzLxhAI0eMhyaK/tdn6kMyQ8BhQPzCvMaLi3mtJS0M1FGkf3WwZP/lxjotNzyMVmbmKZRx34L6wXUMckytMoGyPDWyWQkiFid+I4e75bqDM/rJcmZQB2W+GMDW5XYjn0I09kZ1tVsMTmfs7PlPaEEFqrfAj1ieHbMIn459q2JY3E/dATcL407VPImmjfbv1n6fyrhWD9J+pAuY68VQqYyz7zgU7EfKpwznEaYE8901Yo7ZZWwz6Ru9gMB0BM/M7sYcKmXDGQ1Po9BvCHDT2N4qZiVBfwihHfjraEdbCKRxRZJ2iOXAEO4rbIh0HSfpyu+Vs6/I2Rfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocjDgRabWK8tQpgsw9UAdN4+S/Fh3fNx6J5P7xLcT/0=;
 b=fvIlaRJkkR2QXIShSA5MOClXih80JjLT0sIf/e6+rugTarnCSyjXaZXFALrrWYS7lj7mncrRnsf1NOHUtNh98+aL8XVN8mGm9Ol0Ipmg5/NUfMYzv36/+cGGhG8j1aTcOAuqb7uHTXA1DiBh/ApZjpPFL8+CKGJGLEH+dY7qbfY=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB9PR10MB4684.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:252::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 23 Nov
 2021 14:37:42 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276%3]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 14:37:42 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
CC:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] rtc: da9063: add as wakeup source
Thread-Topic: [PATCH v2] rtc: da9063: add as wakeup source
Thread-Index: AQHX4HNzUIS5EGphikWduNMlpOwuLawRLClQ
Date:   Tue, 23 Nov 2021 14:37:42 +0000
Message-ID: <DB9PR10MB465224854946DABA0F75515980609@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211123140604.21655-1-nikita.shubin@maquefel.me>
In-Reply-To: <20211123140604.21655-1-nikita.shubin@maquefel.me>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5270f4d5-3109-4c85-b09d-08d9ae8eced6
x-ms-traffictypediagnostic: DB9PR10MB4684:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB9PR10MB4684EC2630A22B70D809F7D9A7609@DB9PR10MB4684.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x8haD5LLwdsYPHW/EH8NE0VgGCPUwHvZSbcAbpMVlCx/dUJIvm4FkWs5RKO4H7aJkduaBGGMbfx+IJfrfj9w+Dsf0M1hVLkJhmgPv8A5b6RiJ6JgixgxZtIaxCwfHB6WZd4xm9k+LTwpypJluQ3iBs9hjhVu5AnPX0jDYDQYmpBfYBplsDufThhijTcmGwm++EXZn6U6UCPRPQHbwLIIO3JI6gVPdMC0TiVUPlWLs8/w6p//6yWd42rG/ndnc944F68Sr7tcUIR9nS6AFig67L9qpI6+e80IIpgKmwBXw6mjs3HDfiPKt/ikfYZ0ZLhujtDyiSycbybDn/dcw3zyydQsRdldfH/jA8uLpP1bBKv5yYclw6vWotTdj8nq3mF+5JVE5ogEMNHvyR3cl4e6vwAJ3D33ur6HOzn/m54dDHU9xqg5X3dIAeNWeYLEsfYQqQqmViRkcwaa7NUy/j8IHXHm5qPzmk6s9p72IdUVVtrM4zPx28teB6+DnTuIv0G6wUlnyf5XgQa26TlOwywkTyrgPpz+WF2YBadRKDqsX4/YNkuD9VORr75FE9i+acyZ+FHhFr7oqybWBunvy+m88OdcJKUYa585TSdL3Ioci4f1u93tj18cL98M9hay2GTom3jNHF64R6+cngC0IcpfhTv1tHlC+psgK33pkF+yJXBK5630LR23e69fQEXyotscFV5h2WTURTfXrS9kyW4WFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(186003)(316002)(86362001)(83380400001)(66476007)(8676002)(76116006)(122000001)(66446008)(71200400001)(38100700002)(66556008)(26005)(38070700005)(9686003)(8936002)(6916009)(6506007)(7696005)(64756008)(52536014)(508600001)(53546011)(54906003)(33656002)(4326008)(66946007)(55016003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lKWUm99BYApg1kDFNLIgK5i5MepO9yye4/hn9gWTdMVGWgR2XmivaX1XkIzI?=
 =?us-ascii?Q?CAm6zcFxPphEVIYuWSuHPAiPYnjN9zac8TP6Bu+fn9uDW9tVHwrpUcNhcfla?=
 =?us-ascii?Q?c1o/11E0hrTJqIEeAPgNq6kZHUNOKbmV2lUpcVvibYbzwN+gm8+WfBu3mWYb?=
 =?us-ascii?Q?24Db5Lf4kZEXxo++GYJt8kwZ8Os6BV7vGz+LsSGxBS0EcpdyrgldbMidcN8W?=
 =?us-ascii?Q?jVjNEo5vEb3NToBZOgGou+Yv37vj6dcspTlwq6wxIeVjWmeb/PFc/PtpwfXl?=
 =?us-ascii?Q?lTRmPHLMG71/NYOdfaItNbGDFMigqKXUEX5JkG1BA6Wrw2qTSqWiBotMIrw8?=
 =?us-ascii?Q?OQWi3GwhyduS5QlL18evTtr/R69JYVelkdHp8NxzVJhktwB+3NLZ9DSI2WXf?=
 =?us-ascii?Q?dJe5Vvc2SfNb81lvT20hIXDXkPRc/r8oFuWSsleuilOJFIqk6hO2GCrgdg28?=
 =?us-ascii?Q?t7lIyvOFeFFYXL3n7mbivnxxstvGoFQm7bh15cc0ZUPDn7FgquOVXoYFPXOm?=
 =?us-ascii?Q?rRrqh7hwz1ayl6MVrFGbaeZg7fbli8OfMjv/1csm8B6I+SIT330FkgajRhKQ?=
 =?us-ascii?Q?nNCdktJzSMMXcEKs8XhIKAWPry1mBo10/hKtldJA+wwIU/OZ80QVbQFO+dxW?=
 =?us-ascii?Q?7JRkSP+7pWB+t2EigADh4+PAJBzstestyd3vmXbJRn8n82T6aaVGfILqu1ge?=
 =?us-ascii?Q?0fj/scwpIhvwc5DWYy/cmpAbs3//R5IbwTObWjAxeRrWhCxHj7ed93nFCww1?=
 =?us-ascii?Q?rf2irjgScphkU3K5H2BNXxYjaVsU6B88/iQLCK5F0kSBtomAfViQKnRFJUd8?=
 =?us-ascii?Q?n3TwY2s2RC/i2cQ6GHfgWqSIuMuh0tjwPtuhtG2SFCsORXdPZywe0vRINBLw?=
 =?us-ascii?Q?pDfG8TVzGjsxpU9vLX4veEZu3EjuyuUat5jekzYtDtC3LTWxZY+XukqDbaHo?=
 =?us-ascii?Q?qmRPEy4rnkYI1AizUiV1YCRhja255YRKp+P8tsGduIGKXgx5z6zbu8nOLnyB?=
 =?us-ascii?Q?WlSwLxqi40QX1VKNh59FTWHib0n1Scae6ps6rTyTzglCNjA3s2SMqNt0S4jG?=
 =?us-ascii?Q?EI5YjuwlwM8MGFNKGhMH5GwbXNqYP7FijVpd6ypQ9PEm0VbyMxsAUTu4+YaK?=
 =?us-ascii?Q?0KDtRhMt0UbjI1RSTP1HoKk6+lzvLMRiz04SKUZg9DIwYaFVgymWASAIbAAC?=
 =?us-ascii?Q?7y6fJQOdmXWCFduOXyyJmspwvrfgIyEjnIfkABCSnZMxe09ZwS8MhEnEexgz?=
 =?us-ascii?Q?YrE2+2FU/j9rNJALPuyFkxwf45+g2Eqn1QhOrTNbg/MKybTpsPgJ5Fg5gH5e?=
 =?us-ascii?Q?QMDlTX5n0QFQWLvw7IEu60ua0+P2vElSWC3Qh6Ct3HD5WQFByqLrZTNPNmPp?=
 =?us-ascii?Q?8lqi3n9/B3omgzdI8Ffl5JQoKuW6SsKvHXC2o2ejLSdh9icjCT1Xd4jf54Rb?=
 =?us-ascii?Q?t368uXhtEGera/Qc5NoWUnUBlxouEVN5EOeNGQyEAw2OoTcogJ5MFELf3FgC?=
 =?us-ascii?Q?baxkZtRg2bGRZvCINiAA+C91X9oMZ/YRsI+flL6hmM+ANkN6SQNKfrpycAIH?=
 =?us-ascii?Q?DvD4D4T8eFrcigofbPlJhPejllGfaZOv+3lZoqx1ZcZH/quhIDOJGqymUZap?=
 =?us-ascii?Q?GkQ5KA7WUQQIDHLrnG9leAVnJ1c1RGAQhzKpZRRQxmprbS6II6/ZzSrUu9pg?=
 =?us-ascii?Q?Akl5mA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5270f4d5-3109-4c85-b09d-08d9ae8eced6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 14:37:42.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wqDKGkReuMegNETSIV4SNjO9diTbBkRDndpGGXTQ2V5bohRSC92bV5oVyEze2EioIYQb7dkEAe7BwX0FHV/ZVg05lKYLpcj4Uj7j2ZC+bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4684
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23 November 2021 14:06, Nikita Shubin wrote:

> As da9063 driver refuses to load without irq, we simply add it as a wakeu=
p
> source before registering rtc device.

Can you please make the commit message more detailed, explaining why you're
making this change; what it adds/fixes/removes/etc.? Right now just reading=
 this
I'm unclear as to why you're adding a call to device_init_wakeup() here. Th=
e
generic I2C client code will mark the parent MFD device as a wake source, i=
f
the relevant boolean 'wakeup' is defined in DT, so what does this add?

>=20
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
> v1->v2:
> Alexandre Belloni:
>=20
> Dropped everything except device_init_wakeup, as driver refuses to load
> without irq specified, we can always set it as a wakeup source, before
> calling devm_rtc_register_device.
> ---
>  drivers/rtc/rtc-da9063.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
> index d4b72a9fa2ba..b9a73356bace 100644
> --- a/drivers/rtc/rtc-da9063.c
> +++ b/drivers/rtc/rtc-da9063.c
> @@ -494,6 +494,8 @@ static int da9063_rtc_probe(struct platform_device
> *pdev)
>  		dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
>  			irq_alarm, ret);
>=20
> +	device_init_wakeup(&pdev->dev, true);
> +
>  	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>=20
> --
> 2.31.1

