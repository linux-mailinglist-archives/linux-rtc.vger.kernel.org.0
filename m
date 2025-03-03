Return-Path: <linux-rtc+bounces-3359-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D518A4B809
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 07:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1834B3A3817
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 06:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D153B1E7C28;
	Mon,  3 Mar 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BzzjY7tY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2044.outbound.protection.outlook.com [40.107.241.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE751E9B25;
	Mon,  3 Mar 2025 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740984985; cv=fail; b=rdjCOnCgOrguQV7OTjyFOkjxjZQrmFfGYTUgRNfe6+VExnVHs34nPLj/Cxz9OqgUrnrjYAATEdsU3AT9zrXE3jSaYCwXf4sE6i0rkbcsKKZp+Lc1e78ogn4VLDy1eWIgVXMcxloID6drGMR9rf7zvdoBgg3KYcHX7dMdKo72uwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740984985; c=relaxed/simple;
	bh=GjKpRlO9ZruKCKaczDjDVedR4ziKQFQr76RdmTdZlD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aCf5Pz2OFPEPh8Vuisqe1a8O7R4TEsMtZzdIx+LQZx5g1nKulWGpC+v+9OqY0QpeZCnfwh5lw3WpEnXOdMkc5kRau/0BauX9gHfYNUTPqiNScCzQCxsQnWimGIhMJ1mL4orQGjR2lVsa4yAMzl5CaJYsVjP1D+uB7o+fGsXPX6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BzzjY7tY; arc=fail smtp.client-ip=40.107.241.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQ96K5hyBRQItgvHGr4H+uYVBU+7CUKmH1n/NMvQ7yYigpIv08sFyZkQsRXJiYXtRYjDBH20I8FGxiQJSlPbZAVy7bEQss90LQG8MKjISHlX8uElLTBnU+cskBEmsChH0u9Zcs4cWpwIp7EbRtpMrPAl5C69744NjFBgdpwD464K6sFMuQMuq+fl6A1IHT5n9pYxQyVAvYEDRynMrP6MycSasYmnhSy8jGuoRhN6BY+m6S4KnPNjpbkrgLcPSj5xe4hxAiZX20vo4DcMXOWXkZRnZFM5zG+UcJGx2WfnVR9K/+CXx36cIX66K+JCYJ0gtoB5lg92OIxWn2Fjms+Gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr5f5w3AYFWB1KA92eYhq721F+bNiSc5a2LP9QrZU0c=;
 b=id7e1UI2ForsQewATOxFb/KMqfRD0kehNHZEStgMc0rAPqugUf0vyJgo4Zegt3wPDTAkIUIhrH1PIJZw0DH5quhNjxBoijPcirBTEORtt2L8qIvnCcC8byx9VQ/6+JOuZ+ar54S3Se7aZqcPxBQzplSdsnjs2qkhQ/LBsjU/0WfSyuWR3HuYbglckzxs+uahXP0NqZF9HWenAAv97CZ0herataL7QjU2G4p/boXuvAAzQWsd24Hoq2eoPlnNpZh32oIak+DLlTuMa+RJ1IYkrL2g518B87mRci9EUbMETPv7Vn9fuy7ldem0liR9D7EZR99ERWZAN8FhzM764opM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr5f5w3AYFWB1KA92eYhq721F+bNiSc5a2LP9QrZU0c=;
 b=BzzjY7tYYozptuZSjyRLvGy7PMQyMBDVeDRFMSFNExZFAfQvRW7nH8Qdwqol/DL8uz326Omy5IGz5ScWOZbYWJtJoJrATztM6e0xIspOBYtJuBPLIzHdipA3zmzjiqd97XYhFG0gGx5EHwwuUQP0v3Xwn8RT1zR7/q+Cdc4KfYiY3FdYrFWVrkMc2EcG+YN3Thc7Pzatv3SZm01Ppue3SuIU2ULe/dV8/GzHjU4njuG/+/SVr8M8JBVHpR2JKzs17pYWT+QF3cx9XN6AN/Q5rGpX5tc1+OhUO055jU7j1ojqCu9kL0iUY8ZDqmnb3vgLTX6Tk/WJjrLq+3t17supGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8553.eurprd04.prod.outlook.com (2603:10a6:20b:434::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 3 Mar
 2025 06:56:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 06:56:19 +0000
Date: Mon, 3 Mar 2025 16:03:40 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>
Subject: Re: [PATCH 0/7] rtc: Use devm_pm_set_wake_irq to simplify code
Message-ID: <20250303080340.GA29084@nxa18884-linux>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2fde9c-0510-43fe-4922-08dd5a20802e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pDM6Edhw8dWV3W4LTfL3PKrM2SClqmtmyCubW3QLwUnUmLIAXjxlpRTvzSVF?=
 =?us-ascii?Q?YYnAmGo43X+VfZEXDQWMzG0kFvryJR3bXCHZ3EluXkO46csAUl9i/2YAU6zF?=
 =?us-ascii?Q?en07oSQwiea9XD+kPwVFdYAzwI3aomGdyQJIuROOT0RV5XSgZv6vxCvAvsNP?=
 =?us-ascii?Q?exV6f7+WzJCFrkhWiMGnJ1d/ix6SOAEZb1j4N/ltPOBc362YAcYp/XSPA/cI?=
 =?us-ascii?Q?i79xlFZxVbwjtRIZWrJnSnpEfd/g8ICgJd/JYo/ByV+XV0sZSPljOT/42OcE?=
 =?us-ascii?Q?Wif5HGevGlJoV1J4TapTLd4CKZOcJfvZkIdlzcKz+EQQOe7G7HGL6fjELSqY?=
 =?us-ascii?Q?WlLiP306JoJ63m/JXePMb2AO9jRs2CpJrebVCfECkCtw77LCbARX4nJwz8v7?=
 =?us-ascii?Q?bZYy9f+48pdB0lNESbW407TwJEO9N5Pjd3sh4YwZwN8wWGMxNlb86xH7vvWv?=
 =?us-ascii?Q?efsK2CinybllZjRUXlwUJPLw4kDYADvOkq7AI0kiTn+sixEOLXlX/t+GbHLV?=
 =?us-ascii?Q?8xHLa9NrUriLK4wYU7bfpHcv8u67mvIL66wcPn42eF1EZs+HwS18loq2Sj4X?=
 =?us-ascii?Q?i7IqX8lFmhcIXBufGYIrJsAPCMhDc5W9WltnKrMOJyTcRo0VQAZBLCYvsf/a?=
 =?us-ascii?Q?DdNo43JHh2WYC8CzCWtZ9xKH1uEI0k5XVSB+0/KkE8VwOme7j/DBQzWU9viw?=
 =?us-ascii?Q?T5y0legdL7JXWNK0MUWe8iVsSrcASHzC8TFtdLOBMueVJ1UWO8pBvwxcAs7c?=
 =?us-ascii?Q?PqtvvkbqTpp/ZVTAB9Col93wUazO/pVl3jdzQvLul5b9guq7iznzqbPbo0dj?=
 =?us-ascii?Q?CmxosQKml0rg9+1Q1oiCcf1Z2IG/1vYP39y4AJNQboVlj9xyTywvke9gImN/?=
 =?us-ascii?Q?pFUdFc6K1WB3V0Ie253q/QjegdhUy28Jb6A1kwsHQ9kkohvpL+6bwrjYmTHa?=
 =?us-ascii?Q?bXTuNyuLZrrfPxj4WFYocC08QEVLy3/HsvZhAMreul0+PbhUWD4OJObO7PJk?=
 =?us-ascii?Q?YKHtmsIzwDEAv2Jgnxf2JrWsUmcVTDCjBKJmIo1RxoSzWW0qxRfCG9Zrp7Eh?=
 =?us-ascii?Q?pEFHeBQGbliZhEGRwCzwJUludSpTaNJtGidqLx7NTctaaCkfejrsdBBwOxFL?=
 =?us-ascii?Q?4uTBgYGDHqF4kTClAFOXuaVUQ6Sc7tUPsBOAxn1fvkmQooLIYOrw4Fakiu2z?=
 =?us-ascii?Q?iV/cUipzZ6+RgX22mf3Y9pDiClkGc3NdjeBGcb6eii+z6f5dgyXfdIPuH/f6?=
 =?us-ascii?Q?PnnJULGkXKRM0gBq3Qq2pHKHSHofS8l8GL7OuOBbnQW+Kd8a0wg9LVjWgrf4?=
 =?us-ascii?Q?Pjy+bEfJmlNKhQGCdZdHleOY/t2OzYDtUA2qow4p6h1bXttqINcNCeCkiB6v?=
 =?us-ascii?Q?CKRIWhwIs+laNjvTWpispD8bjEr+uz2KgDhTr10J3xpICVzn0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kLxzXTX7yUvpSVTz+pjmVoOkJUwnIlAiAOxy5F3eLZzNmFQal05YxyWiKZ+Z?=
 =?us-ascii?Q?gMVOrgu4nVB4tGiaPTsB9VHUg9xs89KfL/Fb8ctyccOcLU11/5WNRLu2VXCS?=
 =?us-ascii?Q?WlfnZx/vX6iyKelNXqvzbSedJ63hEdaLuRG29wlgX9/XDK6bsxmRI1i+rKhC?=
 =?us-ascii?Q?EiJ1BFE7ymlY7DrAPYUS0zv3UrGphHEirBqSBhDmit0l3HvwL1xNm1P/GV9a?=
 =?us-ascii?Q?DD8rIjZeBRI2lO2CvGj6+h7V5aeZn3Fyx4wczR3eESuyh+U6z2sekvnavlaQ?=
 =?us-ascii?Q?dDDBCSTN9E6zPg/ea/wBqaZuwsTiwzcMzmEspU9dtkuhUJUhlEtKx3N+9z69?=
 =?us-ascii?Q?lM/wvwihpNMxTTfu6zWo81AjHDbEF7zGEUigRbNS22KwIMjusAr4wIn4ynSn?=
 =?us-ascii?Q?IdgVcUWAZX8wxBWPmPxD60X1rSANnnW0jpa4INAN0Yg8R9tErfPTLKA3cXhv?=
 =?us-ascii?Q?aOESNRFrHsf5HqBX2ca62HVD4zrC5F0WWUX/3VaP0Wu8/5Meo+vcYvuJsZRb?=
 =?us-ascii?Q?RmD6LbXCf3Ju4xBgjvT9RHdr+HOjYubgjoBH/iy9TqaAH9HVfFgFXWlGR4TJ?=
 =?us-ascii?Q?lfwRA+FQhUuCsDYbkFgCzC5OzjFdb+WrYXSm1Lg7ACnlBdi9Op7ynfSwVljZ?=
 =?us-ascii?Q?WOnGpx9wa8Swu8LloIQ8/LexNhl/0HTVqz6oAOwUieVG2J2BBJ8i/v8M/HGX?=
 =?us-ascii?Q?wr1rSoa/HkOcANCMoriWiNiwot2HpU/4oz/YPb8QAEc5LQ1i6TkTzcQ8NQP8?=
 =?us-ascii?Q?zeZXN+cGEhCT4EvrrApe9A/xMKYIg4ALwYDNIkjZ4ur92bx9Rm6vb386Dwxc?=
 =?us-ascii?Q?gyJB5Aqkejac7mGiAqLT+XQ7DurvU1mr2/RpmeEi0uwZTRCFbPud6+Et1K6H?=
 =?us-ascii?Q?UfpSQPLISY4BAEhqTyY2EXEj46F0H7syaPKSK0z58oM71ykmtc5mHnpqwF4V?=
 =?us-ascii?Q?Pa4Oa+XD6HwrgTP9W6SqFDtqOiYfRbm8GhTYLk4gE3MEg2qBR0trhNbTtZ+k?=
 =?us-ascii?Q?Oz25ly3pUk5L1VTx5bIFFsx/NQc0hRgI3109oPUNkCgQl1XJFEfhiLBbvpP6?=
 =?us-ascii?Q?9+52TD8aA2DRoHzb81h+xJQYpKYjwCZYydKjLqVyiIDHKui9NEJVmr6ynHTb?=
 =?us-ascii?Q?FbF3rlnvPRvBtZtO61y+E+WVVySvDOHHB6p0q1im41GkmbDwbSS/a5b+cVJy?=
 =?us-ascii?Q?wmRh000QVakWP9m5wfpaMMjM+7oHRTMEnoXwBm54ILJDj8+NQGyJEHA3Rngd?=
 =?us-ascii?Q?9qZn9h/aVRfesvTjjuMRfaHRqwYTLQ/mVOSjwZHbeluetXgTNEXep1x+BSig?=
 =?us-ascii?Q?6EyMvG8phfBe46WUl2czo8J5E4lzYhD/XDfeGi1eSqykOqa0dKoZ6YFR1KDo?=
 =?us-ascii?Q?ij56lI/wdiQpQtK/C+Edeb/yC6fLlmuNGBD6t0vpXaGB6g2Fg1/VJYy62oV5?=
 =?us-ascii?Q?Y1/qwMUWYqK4t7BjG+2+oArP4phoiRJCDGZ/OFa7ZDwPeqcf6/dNjcmaP1R0?=
 =?us-ascii?Q?B8QaAicGQcbKCb2Kui4F3kONsrUI5K4m5hL5GUTnlsyvSZm6nQ8eeRXJcb9g?=
 =?us-ascii?Q?q3K9Yq/CabNd9JYbAxr4D+oBiVBE9HUE2yQU2Smj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2fde9c-0510-43fe-4922-08dd5a20802e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 06:56:19.5285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aj5aiX2iABejezd2+UYZai4FKsqcSAf51czNQQ60KBbY+KwvrRQ0SGJXRmDYai0syW6+6F1yDb6xct3DvbPZJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8553

Hi Alexandre,

On Wed, Feb 05, 2025 at 08:58:18AM +0800, Peng Fan (OSS) wrote:
>This is a pick-up of patch 6-12 from patchset [1]
>
Do you have time to give a look on this patchset?

Thanks,
Peng

>Since devm_pm_set_wake_irq is in 6.14, so resend the rtc parts.
>
>R-b tags from Linus Walleij and Antonio Borneo are still kept.
>
>[1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r


>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Peng Fan (7):
>      rtc: stm32: Use resource managed API to simplify code
>      rtc: nxp-bbnsm: Use resource managed API to simplify code
>      rtc: ds1343: Use devm_pm_set_wake_irq
>      rtc: pm8xxx: Use devm_pm_set_wake_irq
>      rtc: ab8500: Use resource managed API to simplify code
>      rtc: mpfs: Use devm_pm_set_wake_irq
>      rtc: pl031: Use resource managed API to simplify code
>
> drivers/rtc/rtc-ab8500.c    | 11 ++---------
> drivers/rtc/rtc-ds1343.c    |  8 +-------
> drivers/rtc/rtc-mpfs.c      |  8 +-------
> drivers/rtc/rtc-nxp-bbnsm.c | 29 +++++++++--------------------
> drivers/rtc/rtc-pl031.c     |  6 ++----
> drivers/rtc/rtc-pm8xxx.c    | 12 +-----------
> drivers/rtc/rtc-stm32.c     | 10 ++--------
> 7 files changed, 18 insertions(+), 66 deletions(-)
>---
>base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
>change-id: 20250205-rtc-cleanup-d3d42ceb3d28
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>

