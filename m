Return-Path: <linux-rtc+bounces-2577-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D19D18CE
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 20:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5CAD282834
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 19:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844511DED7D;
	Mon, 18 Nov 2024 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UXM+PuzA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4A517597;
	Mon, 18 Nov 2024 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731957930; cv=fail; b=mXiz2GFOkrutWo3n4WRXbYBevabBvqp7ZWjYVpmaI5fRJhPrV4Ko3ldGk5TKYYEaA4oagTTVys5BYX54Lzo8S6IeAbc1rT17X8EIXuKOW4cvQsO8RET/I2zwjwebzCYh/RbyuFcpZXkQLsaTwiwlCSB62RXvHv8GG6XYkj36xYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731957930; c=relaxed/simple;
	bh=6Du+8ehMgIshijHu9FKHsyYjb+bRQXkB20RskRSFBJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hw4aCetdLB97kEcuieQPOExnrj9j9K3QkvCpQH4Hc47kpdeKOfwFpUDP0YHRifdUv+yCqg2jbRDS+baSEv3aiAJg3zihqQHHiYKIEK3/wpMQ6e5R6zKyy+4GiXPQkLRlkZf1a3tCLmI1cZ7lV+HpIFsDeFpFLg3AEP/MAAB0udI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UXM+PuzA; arc=fail smtp.client-ip=40.107.21.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBBRtRMKIWvPTFSrBNaQVtYxpT/uE7s6Pus1+/QzDUzEFOsCqDkZI0xaZr8Q2xC+uNDxx3KlKw6acRU+3LROILDcl1f5Le5i4gKmT57tW3jWJolcElaa6xBrjER1zDdFDgsKD/CK864xS7c/U+/KEppePrvzQvPf/3RAiJNc5p+6J3e2EyV57YWUoQKzQI/1zZkqOUhOfZvDB/f21mpAmNZg53JWfle29ov40kO1iTgV5F/JVf1/6q7+fDrBfoCwALnveXbPL5WGYXbJUbkNrD/CcYmaRqtKkSU/V834HXets69x6NJLc0BoGHSBT4bfPCAiFP/k7440EKpsjuo+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtWh9b7WVeLlVm7/LD1BgOWtt5VtMRPgI8sgcSXDE8k=;
 b=Yw+X1kbsecah3cia3Fb8WBgB6UW+OklmwMqewssP+RDWYjAm6i6nmm8Tr5RimJEN6Famt9ninyjixZffiFRKPrnPwHah2MuOzOuXW7+RQrgW8qNuQKLVeVxl5XVdzwEh4Hx9fkrfv/7hlIKQzJp7BA706OaPGtN0lG7UAkSrLCI6l+A9hlRYQFH28SrfIOmtC+4X0JOtxIAaXsUh29kqJGe3zfNkXRLsb4CioYSUOdfG1txUIOpVGNK5WkXllZgnm3gSOB2F83cet0wbiguEFJsaCER0Uq9eG/m6eUKmeQVYMITYT+UB49a7S2wMZy91wa7TTKZi2M+wZGFI/7I+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtWh9b7WVeLlVm7/LD1BgOWtt5VtMRPgI8sgcSXDE8k=;
 b=UXM+PuzAmyFlJ5S0sNareaC/g+AuzvbVBpowfMalohty9XPyLpng22ArTAkywi343nqefeUhqjpKJJqJoNq9VGfY6nS4QSgyMRcmFeL32tEdGb419pjMSAvqa8gg5wW/pBco67Hv39gBhK9kouyInzL2is28LDEV3hQdIRgpyKsWb8SjQ2IxGg9SdhyCGpHSZYrpMNjHTf4IarEiLyARs5c5brn0L3pUrSqoyvm8xYc2HZP2sFuw+uje1vtvkR4Ny5wbE4NYRr6m27xW0SR8gBzWJ4Z91Pmfcjz1XNmlGrmWymvhYSLFpUl7rionZrUjXXuL4acKE0oVrbysY7Avmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 19:25:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 19:25:22 +0000
Date: Mon, 18 Nov 2024 14:25:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] rtc: bbnsm: Enable RTC by default to fix time read
 failure
Message-ID: <ZzuUmS8clXgKSbpW@lizhi-Precision-Tower-5810>
References: <20241115194858.3837298-1-Frank.Li@nxp.com>
 <20241116193652a13b3081@mail.local>
 <2024111722084384333dcf@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024111722084384333dcf@mail.local>
X-ClientProxiedBy: BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e85a412-4084-44ed-73e5-08dd0806bf03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O7spOYWowQ2NQPbe/dafh16ENIFfIB06f0lfZX3bB84yiq15OWggkbTw+gML?=
 =?us-ascii?Q?Y8hmH4/7S+/oaWAF3NqlIN4XRG7e2dN0SchudgNSJnm693KI4ZGYUorLduMj?=
 =?us-ascii?Q?Nxsu+eoPkJvmYPofarmCaSJVLxXFrFlpGi+dK6aVCEzorBfGFfJ6QjYGUmqU?=
 =?us-ascii?Q?xPBX6qI3Bjf01Rmb4tkK3yhnTjbK/3jkjnlZ/TV7dI+Z6hsOzac6sOG67oac?=
 =?us-ascii?Q?cyQ25oiWx7B1iGDoc1QBZlRbABYXa3GB87q3GHzgCKvarJoFLStqECOsh6K2?=
 =?us-ascii?Q?vMJGXMSTSk5sZnaScu93+hawvaUA1IZAXq8iWFgmQ6bClI9upCEr+htOe2R4?=
 =?us-ascii?Q?s7tjW5It2YrCyG8aYStvIOZLDkoj05YHQF2Gfw+WxDC2r/MZRTYS8WNKsU8c?=
 =?us-ascii?Q?8hZYlYtV3FI1b7HwejD8bjj971hudnn+iCI9GckLk43rcEPDv/+hCAH4s1rq?=
 =?us-ascii?Q?JDd+St1ZYCVOyN2ahrq7K5W/3eDgiotEdAHu1DZo8GmEa54Ldh3tBhgP6tRn?=
 =?us-ascii?Q?cvfnqZlEGuMYgiIk+QlRXttvfSdt+ot+LIAKAT5ElgG0/whxoVO5sNyGXhyl?=
 =?us-ascii?Q?v6HArJ1lhi9L62r3IuapbV7okqhARARsm1ncu1AYWoRToRtwDW9fbslFD98u?=
 =?us-ascii?Q?UBuopz9+wiw7p4cS9ceplGyrT2u6VgW4v1uY9Vm4Xu04oxOv3VL9rhCjkL2z?=
 =?us-ascii?Q?FdX0ZXf9T/pDlR+yoM0JwLASIGeZ80/Oy/Sbx6lFAPp0aOTcK4aIRiMK6okQ?=
 =?us-ascii?Q?ouoH9GZrt0nECL0sO2QkXEt3q8xteZxcV5poJHzS+1C2O2dJrQEeiHZbwLA8?=
 =?us-ascii?Q?FIO7CVA8aVupdhfjm+jFx4fs+G9NgEMgyo33XOrsfnjJqOLeXX5XsbDuVy7w?=
 =?us-ascii?Q?ZoCcfPlp/rLtsBaSxSdgNYqBh7d+HgNT+Z4qc+qAvsDpdBmzR2xI+LEXn1pN?=
 =?us-ascii?Q?hXJvSE6YsXvrCSUcXHSiaYDl6aOuwnztfFNEIDz6QkoMCo7UV0T4QiN6NMiZ?=
 =?us-ascii?Q?W03CDr6UeJ/j5IZxFVaD5W+pp29eRvXFQbSKXFP6QMyJEUYlQX5qIV0Lj3f9?=
 =?us-ascii?Q?24lFMEEjRFoNCJcs40XnYhvbx2xskDsMu3qpB+NqAhXcq1/AEJJRWm9gHisv?=
 =?us-ascii?Q?+mhRxMBqprkW0P8/P04+7daCbfZENFsVWIqo5LTEA56c6VB9+Xe3GsOxi87W?=
 =?us-ascii?Q?ml6jO4kjmw7cwkOVxNTiGHOiY4HLO79yWYTavvKwNKZi8npvtrzAJxtpt/Zu?=
 =?us-ascii?Q?xDyN3wZqZ7lCWPrC5/jdj0BWbRrKlWO5skOCstq+icRCJWt0moypDD8XnEMG?=
 =?us-ascii?Q?LHyCNwBVROwNrwJz6nfDbQSD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jDDm3g7itwC8e7Gkc+BtLCtl1E6R7iemJzZhAxw1LUlr+m/o/S3ZuKZPyhOr?=
 =?us-ascii?Q?akdtsCvGVMtbpx0eaGRNa01GvbhUxUUlkV1HWaiEIFZbt+LS5hkwO+r7VCRy?=
 =?us-ascii?Q?l4Xpv2RQjU81LsjdoQR7sKZ0yIZnviugxqOl1954qAfa1VnbnX7B0iLN3D76?=
 =?us-ascii?Q?KmPvP4oT2QMeJ07gUsuz/Xp0DyxJ4L1wCGYxf+89kupeqM7tuVskyumu8amT?=
 =?us-ascii?Q?Nesk2AOtyFmakgmMcuPzo6VdGIrkaV6dMH0F+8nNecVoZtfdAJYVoL2dnL0T?=
 =?us-ascii?Q?dyLx8C7ewItwjfbcTKkZ0Ws0o6tYdc0mmBoOnc93twsh2EfpPdWBXbVDo8OB?=
 =?us-ascii?Q?vF2oMBH6aDVileUGIJzP+8BEyQOh+SnU934rg8NyfCrBWHLOAYSlfOwA/guP?=
 =?us-ascii?Q?hducbyTqwvGsKmswJ7/WZg874IWrB+NArT3ou/M94sDXujBGF8J/B6tlQ/KP?=
 =?us-ascii?Q?1DbykK+27z//MV7Bphv4B2k0sBpaeT9zlGAtiEK96U5OXFClYmyewEgSjnn1?=
 =?us-ascii?Q?pZuNRoJRF2xcC5RX820k0w4sjMKjzzTMXq1xZ8aE2YNDl8STMtEs03Qymqqm?=
 =?us-ascii?Q?PNBIxSalV6iDIjoJlpgo/kZh+iZl/isPlMD9oSyIE4v8yZhFYOpo3R6WutXq?=
 =?us-ascii?Q?0Ju0+B2UVS73TEEEkEDI2fuckDbPhRZ3AOVRNbA97chnmd79pgtbgCYmMtST?=
 =?us-ascii?Q?5NfS5TV2ByfuVSBzdFtwgvCyhB12cOnYAug3isQzsjzpf3U2uXaaDpuJy72U?=
 =?us-ascii?Q?rmqJNo54O/anhhy5lLHy9PfC1UPIiGuQ0rZPo/t719QMSC946yOPPQOI3bR3?=
 =?us-ascii?Q?lWQntOh9okGMAmn8B1atsnggfacSsi/nAtf0W/Rm65IVhliv1yP2wGu8q2V+?=
 =?us-ascii?Q?vnigrNNyev1Z1gpbRcPJCXMd3j9QmTPqQRbVB6ldJNGEdhLyKPREFXfQRfmg?=
 =?us-ascii?Q?O4FzfYNto+5v4G3VZqsNyOybvWMqFDgpYDGikia3G6r8w5O9LRoDLLEvTNQP?=
 =?us-ascii?Q?yYl3uMYp3bsiQFRy5IiWpGJ2nr+4FZ5A//Ttl545MrTUXquXSPW/U4Uno162?=
 =?us-ascii?Q?LN8sm2VDJ2DWzH9upSSHJM4+7RqhT1km+B3scDiE+hlVN1kOpDdYWUpQ61J7?=
 =?us-ascii?Q?gJkrpch+ImuPiz0zTRhWyA3MPcYaKNEdHEoObnQlqGDUjY84ExHLM3RkzvnB?=
 =?us-ascii?Q?ky+6n0Pfsqii7+ZXKUOr8wBZO/XUGT4uGo1DStl+k03BbjB/sMYvZN80KLJG?=
 =?us-ascii?Q?8gqiiQej7lNkr6YmonyomByeOzId4qeDouNqBQiG9NSkJQYmkWuyJFOqdv8o?=
 =?us-ascii?Q?yyvAkmwkdjSuywLagQn71w6jNQUsAHAvZyK2u123zDs0z3ZP0vG4V33bos7A?=
 =?us-ascii?Q?YIXBg+EC0FLcvaNwXJwiLKC95U7eLxaoKZDCiE9KWdIFqL+qVxZhq4KxQW74?=
 =?us-ascii?Q?nnQ4sAyQdJfL5emVtM8DnT9sAzU0JFwffAGjwAnoMaEB7klEvpMGVpdzsWD8?=
 =?us-ascii?Q?CZ4h3Bd+cbNTj1KbpESItPIMH5bBrCWDN6iAfiIJKrP5xQjDfIPnGvbD6k5S?=
 =?us-ascii?Q?9zxlgI0GRVbSNMjwC7o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e85a412-4084-44ed-73e5-08dd0806bf03
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 19:25:22.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0120I03RzEyRSyzYa6Fl7DTE7zTnApYAT7XfPG10DK2VuAOdftndWIlPR6oRbsk6kPaky57FgdNgLnNa+vsTRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640

On Sun, Nov 17, 2024 at 11:08:43PM +0100, Alexandre Belloni wrote:
> On 16/11/2024 20:36:54+0100, Alexandre Belloni wrote:
> > On 15/11/2024 14:48:58-0500, Frank Li wrote:
> > > From: Jacky Bai <ping.bai@nxp.com>
> > >
> > > Enable the RTC by default even when no valid time is set to ensure the
> > > RTC's time read and alarm functions work properly. Without this, running
> > > hwclock results in the following error:
> > >
> > > hwclock: ioctl(RTC_RD_TIME) to /dev/rtc0 to read the time failed: Invalid argument
> > >
> >
> >
> > What is providing your hwclock and which version does it have?
>
>
> This is a bug in util-linux that needs to be fixed.

What's suposed/expected beheavor? I think rtc should be enable by default.

Frank

> >
> >
> > > Fixes: eb7b85853c38 ("rtc: bbnsm: Add the bbnsm rtc support")
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/rtc/rtc-nxp-bbnsm.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/rtc/rtc-nxp-bbnsm.c b/drivers/rtc/rtc-nxp-bbnsm.c
> > > index fa3b0328c7a25..6610db2f75125 100644
> > > --- a/drivers/rtc/rtc-nxp-bbnsm.c
> > > +++ b/drivers/rtc/rtc-nxp-bbnsm.c
> > > @@ -189,6 +189,9 @@ static int bbnsm_rtc_probe(struct platform_device *pdev)
> > >  	/* clear all the pending events */
> > >  	regmap_write(bbnsm->regmap, BBNSM_EVENTS, 0x7A);
> > >
> > > +	/* Enable the Real-Time counter */
> > > +	regmap_update_bits(bbnsm->regmap, BBNSM_CTRL, RTC_EN_MSK, RTC_EN);
> > > +
> > >  	device_init_wakeup(&pdev->dev, true);
> > >  	dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

