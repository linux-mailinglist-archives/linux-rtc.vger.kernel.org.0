Return-Path: <linux-rtc+bounces-2437-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D889B96F5
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 18:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B6E2B21040
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 17:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077BD1CCEED;
	Fri,  1 Nov 2024 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MV3CmoPB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE619B595;
	Fri,  1 Nov 2024 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483857; cv=fail; b=ItzBrJMDCrYQFVGgOrdAQYsInJfbF6kD29FP+QZDklTRpnYYMJqItSr6YBYC1Q5P2++pDnQMHkQgXtPJr9XNukTK3/WoVj7XGQ5VLUEXUMBK1VF81VA51BT/1xb+X2aX0F4EaFYb2awACz4gGX1fVwyPMB91HT5CQiYmYKHawHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483857; c=relaxed/simple;
	bh=XX7S068uyHal1NejHJsWD/0XgyWI6gZrLlNgOwDc1KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LIOtW7gzcMg6kfd3xHhIYIJWvdVGtLwMLETnVSBe32zhz/49ZXL7HnkihJRRFVXW8eBiSvjzfGjy8L4pd+bRdykQ6VirdOHavjA4mTsRZ9cFE/hDkl7sX9+JmTY76jZfJiYJMSe6SanwjZIWaJpebqIQmy6UdibhbcxMeKmWGSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MV3CmoPB; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJURhPsKr0ItCOR8W38GvgM8W9s0Qs4rlLEbrpMhSO/ll+k5qKPrxT9iKNOpNx4RQSvbxAAMK2yrMhtGD9i4SmAKFlMx9WDuJDAsmJ7ITcOYnsZ43EYsM1KID0yYiBXUPlMUmAM4iSy3TrRLC3fSSYMztTCxI9yfxZ8aFN6CaeP79cIs0qzt3oqzFRDG3LlzMh2LQ/yEAttJGBHGH9e+s4+1bnwWzmrzEFOCksxJyfvclDrdidkimAXC0EPIulVqUsVeYDGULa1lGfw+hR8yBigU5oZGy0HOdk/bTu5S4iuH2JSjA4W1+W6DD+p/zz49yLBSJ578XCPHPHe2+X+NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDLh5Wd/MC+BZM70a/MnDy6Rz3P2W6vq8xatWnnuCME=;
 b=rZhgBs6DDHYwBDJWbJIzqpyMom841LBgcpxCgsSQRCDKvbtnHycc0ayPn/uhRFxUEeilPA3lRhXZfF1wVJ9rWqnOpNQYcHjVfWR11ozTdySg7+3NtQrht8xFHBThP+w2jyNwzKCGwFUXuLq3JNQMJ7Nk8Nc8tsHQWGJMyrtCvthMZEREw+1W49uPfemHOlS1dWwut5utfq5btPr1CoGtfflYb6Bc95mH7Ga8+Kgh9qT9N1iPcz8k3mr2rqxRiA2kFqtLd5XYqw2b4X1qsu/Qdtnw+6LrjJsSy8Yox073xHRdg1YZZXmJvnMGjNJ4qGNyJOYIEibDV3MWbclY93MOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDLh5Wd/MC+BZM70a/MnDy6Rz3P2W6vq8xatWnnuCME=;
 b=MV3CmoPB+zbbBXtkCjVmfFCD5DgnFnZ3yjaZ3/DFjQdeil4LzlP+O1wPBPbb4dR8OuqJ3bfG4HGtHPG0OhgBNwDTHwZzPG4GigSksQAoaY5UeVkd4QzOWGw1rIrbXPWMgnC0twai7/RWCukKGxbQH348q/zF6TZO4bDFCe31PPVFZOLkGAUEUOogEVTf54mszJywNv8BQ6eVf6u7pfP3nT0Ujay7EMYClXQe5SKqljJAGr+QIyHZzrGFG1xpjZTgqxCK/bg+ZIteE6Nc2scGUtMmn0AF7oXZj8qXsPI4/duyCalUAhtDwBQGhHmmuOFnouE7ZIOBvRrWH3iSmgRYJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9381.eurprd04.prod.outlook.com (2603:10a6:20b:4db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Fri, 1 Nov
 2024 17:57:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 17:57:32 +0000
Date: Fri, 1 Nov 2024 13:57:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	IMX Review List <imx@lists.linux.dev>
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <ZyUWhLdODsNk7KTe@lizhi-Precision-Tower-5810>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
 <ZyOyvgw0qZ4YKwTi@lizhi-Precision-Tower-5810>
 <4b82e393-093f-4477-bf0f-ee559a3b97c1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b82e393-093f-4477-bf0f-ee559a3b97c1@oss.nxp.com>
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e539f1d-306f-4ab8-2fa1-08dcfa9ea911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OoX1o3ZAPd0UpOH2FoaMwMlcB3p/4LwFRIaWF6qhXfsUkrz+on5CPrGHjhpj?=
 =?us-ascii?Q?ZL77BCv9J2F0DBMix1mXL0r01PCONRYh9I6jo2G0WjzDO7XE4l26CcRY26uq?=
 =?us-ascii?Q?gqL32STDAloOHK+k87vQ1WJ6wsU4BsycJYeZC+D538iWUmUYEMDeTMRHZSbC?=
 =?us-ascii?Q?+p4FK3ERNGNEX/B8ifl5wUYRWvTDOssw0JeNIokt47vqMwacLt238YVMt7/N?=
 =?us-ascii?Q?njeemz8Szw8r3VFLRpaCtDVm8WHZzP/j37fHqQ2tUJib1jXuvm0l+8LJ6xEa?=
 =?us-ascii?Q?/JuKlIJYXC+6evQq2erY3sCy0AO8MWz7Y0+CVMG0w5OHvHrWBcgMgC04/od0?=
 =?us-ascii?Q?mtdWhPsIm/Ikm5GTKx62H4CkpAzasmsBR3x/kXhyjZ4ZtwzMsQnEplJH664+?=
 =?us-ascii?Q?/vZVx6XqJwn7cm9t3CHaeEy51AVGLFum9EzcoEc+v8CNDMUJqz4kdD9ylygV?=
 =?us-ascii?Q?ahZWzH+8xGlSGoWk7PBMpofr1dm5gEP+KLjRzOV6k7hIInwddiqkFuRiB6Vr?=
 =?us-ascii?Q?4mNk2EbmCZReoU1vpfF/KJll5o65WJ/iF7HIS91ZtOGCZsTCioHSCLGdf6lq?=
 =?us-ascii?Q?gcTJdiAqvL4cjDqa1TNt9D1LJX4DvbfW8Db7eBh2Dcrq0Y1S+ZK+u9qp7j7s?=
 =?us-ascii?Q?/F7ORKw12qOpwYT+h3iYtpQrw/Zfsb+dXe6D8sg3xe4SOhmTOkfCkHu22Vzj?=
 =?us-ascii?Q?dDFmee9v0hYCf+ES4cltkM3UgiArMu+EErjkjmdaxd8m2fLf5iQSW/c3tlGb?=
 =?us-ascii?Q?9UiTOobSX7DoJ9z2TZHq10KEYcKsh045nQMbMi6gXnrWJHNoc7ET0JfNjPBB?=
 =?us-ascii?Q?dU260n70RUGHZ/11eTME7oP9tms02dvGLxGT+fVDY/6eg1IEs2tn0TrcHEty?=
 =?us-ascii?Q?sHZGfRBg692/Jj3cSv23smOwypdZ5rBH19gB20R5abFm65y/FCOUqK1e5uSC?=
 =?us-ascii?Q?wHsJX3Tt8caurAPEMi3XwsVpk3YnmiiWpjmNMEFCoKkiYX+W2OwS5QYExxXp?=
 =?us-ascii?Q?VBD6xQiwJQrMG1Zs1Q15IMNPg51TS3Cto+hKpF3sM9k/5TELyMs+eRNV+vDT?=
 =?us-ascii?Q?EmTEbwI85eB0MdcudDjfPb7Pvqb9y6bgGzFnKteLSw5TyWM9lvRroJdxURx4?=
 =?us-ascii?Q?jVAss+NA8iA8iA3dGhRuPtg8btv92p9S8tvTWoScJc574E6j0JhnFDGsCaje?=
 =?us-ascii?Q?uiBFWlWdpPibdz9wZ97OnqwwS+uvLxv+ietX/Yq+yMA2dqR3Rp+u7uWx4OHK?=
 =?us-ascii?Q?CkBHvD2Q7TuF/aiLh7G9FrLrO5Z+efwNIYNJ/CjElds89hCk+hSI4C593m+H?=
 =?us-ascii?Q?RCN7LdQZX0wJ/j02W1BX0Shs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZrDJKMF7hW+SEj9tcdb32rwhwY9BjhtA3IImHWIMYbjZraUNmiUf0jficfUB?=
 =?us-ascii?Q?sRc8lZ5UDRgLC24/CKscUYKurfaEkzQV0YtxDvaIQdjyibdNgqybye5vHhKp?=
 =?us-ascii?Q?TkojUxX6iqPxpdS0M64nz0qmnPco+CBEDOqnwqqDhtf2Nt6vR7hV3JyMFuGz?=
 =?us-ascii?Q?Kj1yv8R1JAyaiEXNzmZ3RKvEm/4507GiSBcLDYQh4/dlzVMWG7UMj2T1KO+o?=
 =?us-ascii?Q?PEVNEgqoFIs5C91ygA5dmkmEFEHZwMxOLPZ4laeakfZcBeck7uXxlnrTBcf5?=
 =?us-ascii?Q?58Ra2yBxBQAyXA8RW94cukPjp6xxCaKiHLmzcEsrlSALSNGD++g6sHzxLgVq?=
 =?us-ascii?Q?qTx1ct4RfIJ/g1WvlnR2suomEhhmnQVCd+/VpWG7sRpRGUto1o9+A5PjEbY1?=
 =?us-ascii?Q?jND6meLaVcyKJBgueMihttn8WbThOj47I/M8Ln54OXIPDnqhcqK11lgRdEoH?=
 =?us-ascii?Q?7ZxPJiNagGrot7Ye8MyvU16+Wss/i2XUMamfXFspgfEtnR3Hddj4rYp6MVF3?=
 =?us-ascii?Q?g4c9VNiRpkq8MVvLDjm/Qbe1jgLhkdFbQRhOgE5itQF7hyfyOchXM/0F5Qr8?=
 =?us-ascii?Q?qBywLMpOl26QOLf+KHsBx+F5ezyMG86MORllrsE3dqe3ZViozcw6xtEgIhtF?=
 =?us-ascii?Q?iPQNVTs7rpXSLia8st4uo8mkbzZvrHMJJaRRJaCdKI0swTgN7kiAjs31g5kG?=
 =?us-ascii?Q?VVr4ISr+o6w6zru1lX7ymGblsst9Hs6rwzyYv+rKuSTGu5nAqpGT7zuoztTO?=
 =?us-ascii?Q?xE4J82re2KQIhQ+Z8v8FE0KGdgJhWDoWKaZLu24NFSKZYGLRLYJrZiUoTRnI?=
 =?us-ascii?Q?J6HnR6xpkz64ztny1JMyn0vubljsgoiFOlY2hJJrjesbYw7c9ejBdn6gpJB5?=
 =?us-ascii?Q?VgfMyCDvrnzNRP2JY54SyRMTUXcbIMAES22XTtB0lVRsgE5YbsYpgpJJY7Ld?=
 =?us-ascii?Q?F3ROdYVrCprpFB/TaZiZjc6V3+aSBXVhpVAtDTqJQr+8LIPqQ98e5x8eycLj?=
 =?us-ascii?Q?JoTk+Ba1Rx5ynESNvBOdI7fWmFY0OrrAgVNre8H/5+8oS9XmW4DbYYQXpZRk?=
 =?us-ascii?Q?owauMpk8K3K0/7WcqrztPoAnUOHLdWTMS1WaMQpCYMFPsEuzuL7j5fv9WnE+?=
 =?us-ascii?Q?e92PlCXzrR1vIeQBFnG9Lv7Ati+xdgiQr0QhjBDxTl1s7qJLg1WPsDpqvlFR?=
 =?us-ascii?Q?gxE3xRfg1szhwNDRj81NmMEnllH0MAngr+iu5xBIqr0OVnaKieWjfO28IR6K?=
 =?us-ascii?Q?kkAJkIIdtgsotQjQOn3dVVtU0iZboRfyVZsWItyXDM/gH1DMio01R4BBmCfO?=
 =?us-ascii?Q?1KvxD0+UhufvkJZzco+1hpRMKkT6+MTurX8dk6HocwqIjizbsEmOHSHyY38t?=
 =?us-ascii?Q?BCCFfEWz8PWSX8Y6KgyJ78UsooE4oH1jIyYUQqyImOMHoJ0uZ2ANj3OqzPB6?=
 =?us-ascii?Q?ZvOaYPzQCeeZay/GFGtffNOpRN6u97hQCUa62B3qGcCjulF5i+kIrppsSEvE?=
 =?us-ascii?Q?ERVlWRXJolIjsuFN/SAv20XrMIZy31SBy/7m6ez+G57cVEpKGS9x9KX8TjW8?=
 =?us-ascii?Q?7sO/m/lav/f58TT9mRGKZ3P1wJ2Op6BkPp8TrDMQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e539f1d-306f-4ab8-2fa1-08dcfa9ea911
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 17:57:32.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h58uNRFR54MK3sGXoj09plx6u6X97Wohnvlsl35oqSPBzz//f+P45N7vEB7CElnG2QeywwVMaD5qK7N/K4p8TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9381

On Fri, Nov 01, 2024 at 11:29:24AM +0200, Ciprian Marian Costea wrote:
> On 10/31/2024 6:39 PM, Frank Li wrote:
>
> Hello Frank,
>
> Thank you for your review!
>
> > On Thu, Oct 31, 2024 at 10:35:54AM +0200, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >
> > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> > >
> > > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > ---
> >
> > next time you can cc imx@lists.linux.dev
>
> Thanks for your suggestion, I will start adding this list.
>
> >
> > >   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 99 +++++++++++++++++++
> > >   1 file changed, 99 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > new file mode 100644
> > > index 000000000000..3694af883dc7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> > > +
> > > +maintainers:
> > > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - nxp,s32g2-rtc
> > > +      - items:
> > > +          - const: nxp,s32g3-rtc
> > > +          - const: nxp,s32g2-rtc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  "#clock-cells":
> > > +    const: 1
> >
> > Does your RTC is clock provider? why need #clock-cells
> >
>
> RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 4
> different clock sources (parents).
> Now, as suggested in previous reviews, I've switched to using the CCF in
> order to implement this hardware particularity. In the end I've resorted to
> implementing 'assigned-*' approach which while not mandatory as per proposed
> bindings I find it quite scalable in selecting clock sources for the RTC
> module compared to the first iteration (V1) of this patchset.

Any link of previous review?

Frank

>
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: ipg clock drives the access to the
> > > +          RTC iomapped registers
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: ipg
> > > +
> > > +  assigned-clocks:
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Runtime clock source. It must be a clock
> > > +            source for the RTC module. It will be disabled by hardware
> > > +            during Standby/Suspend.
> > > +      - description: Standby/Suspend clock source. It is optional
> > > +            and can be used in case the RTC will continue ticking during
> > > +            platform/system suspend. RTC hardware module contains a
> > > +            hardware mux for clock source selection.
> > > +
> > > +  assigned-clock-parents:
> > > +    description: List of phandles to each parent clock.
> > > +
> > > +  assigned-clock-rates:
> > > +    description: List of frequencies for RTC clock sources.
> > > +            RTC module contains 2 hardware divisors which can be
> > > +            enabled or not. Hence, available frequencies are the following
> > > +            parent_freq, parent_freq / 512, parent_freq / 32 or
> > > +            parent_freq / (512 * 32)
> >
> > Needn't assigned-*
> >
>
> 'assigned-*' entries are not required, but based on my previous answer I
> would prefer to document them in order to instruct further S32 SoC based
> boards which may use this driver.
>
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - "#clock-cells"
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    rtc0: rtc@40060000 {
> >
> > needn't label
>
> Thanks. I will remove the label in V4.
>
> >
> > > +        compatible = "nxp,s32g3-rtc",
> > > +                   "nxp,s32g2-rtc";
> > > +        reg = <0x40060000 0x1000>;
> > > +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> > > +        #clock-cells = <1>;
> > > +        clocks = <&clks 54>;
> > > +        clock-names = "ipg";
> > > +        /*
> > > +         * Configuration of default parent clocks.
> > > +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
> > > +         * 4-7 IDs are Suspend/Standby clock sources.
> > > +         */
> > > +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
> > > +        assigned-clock-parents = <&clks 56>, <&clks 55>;
> > > +        /*
> > > +         * Clock frequency can be divided by value
> > > +         * 512 or 32 (or both) via hardware divisors.
> > > +         * Below configuration:
> > > +         * Runtime clock source: FIRC (51 MHz) / 512 (DIV512)
> > > +         * Suspend/Standby clock source: SIRC (32 KHz)
> > > +         */
> > > +        assigned-clock-rates = <99609>, <32000>;
> > > +    };
> > > --
> > > 2.45.2
> > >
>

