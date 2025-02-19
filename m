Return-Path: <linux-rtc+bounces-3240-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A4A3C518
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 17:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8996B165086
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 16:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C977C1F8F09;
	Wed, 19 Feb 2025 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="jYptpt4X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC21991A9;
	Wed, 19 Feb 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982826; cv=fail; b=FLFt5lixMDFf6XYkD7voKAIFauP5SEdJRmO1IOq20VsDMGiIgv7kEkSa+9pBXcHkdtsDZC0ruqrjN24VM1cTBXyzzYird4DEHxkSa+dESR5YuW1GDqoUt6/9aCow23BUQ6qyVw7QvkELwnCc4sWrODS6ny0T3luth96MmJJ8MXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982826; c=relaxed/simple;
	bh=Tmg5RFPbifcu5+kB5deOUwJqPQl1kgcUBBP+30B5ohY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qnz8BxEsE55h7rSfEMw3UQj9PpoBiyGlsrIED6Kic26Kq9DIOIKLBko+6vjv1OTkxUoWHviYnIjD02YzbnXEXs41eOJmwQMfcsYqmRwH8XD0A2ymIruw9DMWGGRXcTY9TfLANqaYCCKaUMqMfY1+COj782PMNNMh9yzlPKQx6h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=jYptpt4X; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVJuoYKDFriI8PKWuR7XVQf8px9PNDh/K6DhXjcWf4P8wVLXRmH5A1vzihNPWxGdEhvPFNCQuTibmpUlpoi/Zep2HJ2kA63NDKuOSuxnJcG1PPLZyh38QlngympE+Ltsa6O3ubkHbn9TE/zcyJZLr5ooGdJ88ruJSp7onyXZQ8DI3EGWdzlfd05PjgUuTFkq2TrqvTc+byj+ATaw0+hSUaA7wBC39byYApApdIFAjR1wLIRSwW1z6ZDwfu+YVJg/4NzIbRtnt0u0eLofIqdflOaxPWMxya3DyfveD5dDXA0Yp98zy63H+P0o926Dd0QnQbrCBjYYiNjL7tCObm7DhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSlRbCsrZ2gOo7r4QqXxfusn9AwdssKtb1nMiqBDQZ4=;
 b=R4kMTU4/i5JRcDXAvOIHMhxk51JabN2SBd7c7SwNPkAvVRYx0o7Nb3FC62FvOtnvW1lZD/USIp/UAfa4b+gx/8y57LOpu6mBSrinfl+fQYORVNme1RJHPHKq069FaeQWO9Mcdowi8gvY/fkYMglyW565U+ttReRt99A6qQ3mCKJVzPA6piQBBEBo8LfkQxe75tB3N9eZ/PeBVFztGHPpfL0P9ApOW46sKknV6EZ105/3em0CTLDvu83XvOgBv9lz6gYR2NQQae5ekFC8q4bMnO0IXQ5GD6/9Rom0RBzgAFiHWRZBi1INvn4zHJQXZrYOXq9pYfopXlE3Vvl2Fr6gLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSlRbCsrZ2gOo7r4QqXxfusn9AwdssKtb1nMiqBDQZ4=;
 b=jYptpt4X79HHWeq/F2MzuyJ52pyvHxj+UPc8Mf8mzGltsTeN3cd5rB1q5Ip2C0KmWt9tNZsp+8BnnOFXyLlY6uNoF99BSapSz7q7kBMRcWz/r88tShVxDpKcndW3no9ovvaSkNTg+pLaEE2KzeTYk6q2PJn7N7qVf0Vsy8Ua3gsxCD2kBCrS/0XiCsdhb8t9GqPVsBD7HWxZBc8BJaKh0JsPTnguHREKvCJK30ohLv2WmI+1+Fc23MwE9NqNj9k/KcuM/BsL2kmCRpsKgUVCvt/EjL8j+3CTqqL0388MTu6zEhY0IggzCVsb/VJHxEIjYvK+vX6Qd8Sd/NOq2FZ+ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by VI2PR03MB10860.eurprd03.prod.outlook.com (2603:10a6:800:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Wed, 19 Feb
 2025 16:33:41 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:33:41 +0000
Date: Wed, 19 Feb 2025 17:33:35 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] rtc-rv8803: extend sysfs to read status
Message-ID: <Z7YH3_DqUkdU9mwW@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
 <20250116131532.471040-6-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116131532.471040-6-markus.burri@mt.com>
X-ClientProxiedBy: CH0PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:610:77::13) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|VI2PR03MB10860:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef95498-967b-4bf0-f6fd-08dd51032bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vO0UsG+SsV+EI8G6m2Ll+JRXjNW6L9XcbIt7V7k4PLXPFfVOlVOfJScc6uCv?=
 =?us-ascii?Q?t3moVPvFZZ8RRV0apmhYqsr+ZDPbRZaDJWO8xdabKQm11N4eSPEesLMl+1Zz?=
 =?us-ascii?Q?6QezfNK0iXDWCM2c6McUubgdtQ0Mku3DeasObozZrtUd0dACtz9pf/YGU4bv?=
 =?us-ascii?Q?ILCaNC2Lp62cggOkGHZ+z9hl01VzQAZrHqvExrFu91xgamaQZblNeKuPypQH?=
 =?us-ascii?Q?H5q6k91O86zyb7BlvhDPDWxNDnlURWhUzAZieqsZRKHi9/MwYMmZJ0Dr/+Ld?=
 =?us-ascii?Q?Uz5D+qdc2m7jmKPFmj50uabaUWHvJQy0eBrSxwtkZqlnElPuyyWDQwYVeCc0?=
 =?us-ascii?Q?V0IzyuHpV50unopHubk6UurdjSPpTXTUAboTo5aA0W7mOqxyssAudilmgiYj?=
 =?us-ascii?Q?h40L8syjFOCOf/dnPZG+jZuFbuqb2xIAfwBmkU/xILDy/gTu867UyOIi9NSB?=
 =?us-ascii?Q?IXfSoCeKWRxCE5/zs0BONn8KZZAX63GtwqdMSyr38yjtmapwnt2P7GUK7pMU?=
 =?us-ascii?Q?4ZXnrdrJVmx1FDqCu6RAncxLB8Txxu2O6ndvgGE8+3Ta9NnWs2CZOXLFoNVH?=
 =?us-ascii?Q?Ua20wPCdV1tJ3Y5y5xAYU65fSLgA8R6ILInFiX5OmtxtZGnNfozWtiWrp0Vd?=
 =?us-ascii?Q?YWhO08Pzbj+KEH14lIoC6IDlD2HkG+E7mMsHTbk/K4FJRQ1XXaL3t/pZ5V15?=
 =?us-ascii?Q?16BFelVvd6ACzzkhVvFxb+FuZiL3AUW3rTE8EaGCWyEnU6m7hTyvHxOJlV4L?=
 =?us-ascii?Q?fQopMfGlCFTLnqy+44YgIigdIufzVJruU3F+8qzlw3GAK5LRJjqU8w3bZ46r?=
 =?us-ascii?Q?IxSzoIJ24uOUQonsKu6JcfRp9b+cGUlKgkTztVSyBJ95C1p/lzq+4oKw1Cy0?=
 =?us-ascii?Q?CMnrqoVDHk/n/HBeLTVt70WdH6prQqifUBXmoK9A/lHXJUmB+Fx9RzOChv9z?=
 =?us-ascii?Q?+M7Q2joY23nUaoPperROWmSDK2BanYUrxpIwHdat/ZRqXE05GjpEagqLqno8?=
 =?us-ascii?Q?h0mdKgopUcJSMXlIakx1nEimrrLv26TZ/BqkBV5fRkiGd35MtNrjFWZAQkWk?=
 =?us-ascii?Q?AwiZ4BtxUkD8bDVfOlxrdQKFCtFPBQqVzO9XvCHeSHgTzzeDI0TrDgVARSez?=
 =?us-ascii?Q?pYLlybYibrNiszz7bhKR7SAJuZ6MfuX/LtgPk6Dzxhx6lBNzWw4RhxhueUZB?=
 =?us-ascii?Q?K73JFqLSoqu3NwtYjc3C8sUyBdnfr1UdCgrQTc5lUq/tT9Qn/vK0hNtaySVu?=
 =?us-ascii?Q?ztnfXJHhldh4FW64jc3wcUbJprQB29DOnXAcJdeLN+A+LerhE0XPTo+SGcZo?=
 =?us-ascii?Q?CFd3Qu/IfMWclKLi3Ys4ZVhmg0uQuR2D9LUKAVgYQVuiMCQPNpf2y9aqmdLE?=
 =?us-ascii?Q?bPIaPa2bIZtrrjSykZjNcHuB6yQayByw+bjn667Xu6NNVruLP2Eh0pX2HNni?=
 =?us-ascii?Q?1SNjQimPCnncnbTnUSZumlJo3Eflcktg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sFl/3b9Dqy7RRFIEUclyiVgLPiMjDOdIBCjtvnvHxKhaocy5eHAv1BNd4ty/?=
 =?us-ascii?Q?eLdk3fZyTjxftt+j3X3/jxwDBSyrtD0k/rZDdw/beu9/Wi1WHqUXBOhvPy2W?=
 =?us-ascii?Q?bOOXe52fpNJdSs6n5ABkph6zV8bgu+fW8zoOTUDQs8NniIQ5GHczOMyA7ZVW?=
 =?us-ascii?Q?DMKB7tWvViY3xMnYt3rAgzidxr8ZoA0gw6dNhZgpjfWSNRQgIeJC4/Gctk+i?=
 =?us-ascii?Q?H520E5TL+ugaxMSz/8dmYiZFJDmQd4OwRWG2RnAyY/Zrnl/a2BewQsB6Erlh?=
 =?us-ascii?Q?OmgCFpK/R2t8RZDY7l2LV/oWzS94YpxqODVObIeIS7ciO4phimwUzPNmoJsi?=
 =?us-ascii?Q?53qc0DJZIDfgYrXwMuUDVoHlxiVPX0LG8JRiHOOYmJaWuXwns3xDA/L+2Yy9?=
 =?us-ascii?Q?o1Q3FS/OKijI8x5hqFNlgijoPvVGit7thV5Ln8j8RGWPBnYhTXf/87B497yA?=
 =?us-ascii?Q?iSSOV5N3uRmf3JcT/q47/aNkS6JpG7reE7ZRtJ3d4KyrdXUjUJ5HTw0a+TGs?=
 =?us-ascii?Q?Xsk4gzsiplz0uQigGPXH8Yk/4p8GWnu1uQldjTZ/GpPQtYTvemZXkKNAacgB?=
 =?us-ascii?Q?W994JKMAKCOsAtCOsG+KwFjE0b990CohHyH2N1a26LjCmQ2R0M+rpytLroq0?=
 =?us-ascii?Q?oUUBEnUpVgWM6kEqTM92LI88xFpdODusrKMsdstwpFJm3JZpEeRM6IStm+JF?=
 =?us-ascii?Q?4pWl1UPFKUH30iDTWnDnOt0zWFahJnq5kh9WVVHytTcGq8YmkVCtJQIu/3kf?=
 =?us-ascii?Q?Q+MzaxrSylQOXNc7jPHdkg/5+tYrojwxa7jhlJ/wAAvp9jDbEeaPdwBpghfB?=
 =?us-ascii?Q?giUiDCKTCd4X3RECrFMLEVkFJCjyvo0SxQR7P8zqZJ5gzbB8j/JMv0eMCEGB?=
 =?us-ascii?Q?amUVsUNPmUl5zz+gLqpbPIMcLNbLZHv0oh15hkFuO+Uk/02g3s12V75QuUFc?=
 =?us-ascii?Q?ZyyOXvGImg08JLer5UL2QBlxxV0vYurYtCxbovm58wdo4j7G0tsuUsIQYMdw?=
 =?us-ascii?Q?8PLfItCtZFDDJsW1EJ1xBvN33VIVr2YbjOZblxjifcQxfeIMIsNgmFz3Anx4?=
 =?us-ascii?Q?mBk/eFs+c8qunIP3y9xlVFOAoMQhxXcaz+0peletTWxHjTG8FGFCTbCxn8aJ?=
 =?us-ascii?Q?OnFxtDx4f6GgC30u8ItwKiaa77L7cKmAlavgBb0mEwChJP327Vm3UGeQSTo9?=
 =?us-ascii?Q?ltMnIUp2bTu++hmuXN+hhwGPR3lqAtNk/iGIrulwUoNAJdthXkouGcKOiyXt?=
 =?us-ascii?Q?hFtTqoxpyqpWRty0W/DqrZUmQuhYR/lWnCbmmjYPa6A+NtOqSl1mNmtu+j2L?=
 =?us-ascii?Q?e/Zns46R1Kb5NwiDSwMVr8oecvXO8EUgA/9A9WwEyeP3JWtLGAECkEieamKH?=
 =?us-ascii?Q?E0wiF2oR3lMhWRkWX/z3JqZ9ekCrl3GNGwxuon5ieC3QK53+gJM7cg2wcGW/?=
 =?us-ascii?Q?sBrh8dfVnui/TnEvKziyHXxgzTMNwQdCJ7moKGPbpiBn+/hOETGMPjS1Je3R?=
 =?us-ascii?Q?B0a1J552+Xme5yvI0xTNO0lGfFtlqFHGfHVQapz+xLSlbegA1z0Un2UKoRXF?=
 =?us-ascii?Q?FQ70j/qYARL5c1RNataF2F+zcu0WUv1TqdKq1ewj?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef95498-967b-4bf0-f6fd-08dd51032bb8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:33:41.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SrL4HiBtIbJMiGkfzJIyBFCvEnNAW/O3NVq8Zm+20Hr00vqlPkXxDxQV7ZgR0r5iQZGhXnGkH39NKIcvLKuBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10860

On Thu, Jan 16, 2025 at 02:15:32PM +0100, Markus Burri wrote:
> Add sysfs functionality to read the status and configuration.
> The functions provide the number of stored timestamp events, the current
> EVIN pin configuration and the enabled/disabled status.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  .../ABI/testing/sysfs-class-rtc-tamper        |   8 ++
>  drivers/rtc/rtc-rv8803.c                      | 106 ++++++++++++++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
> index 2fd6578a6..b3aa73c81 100644
> --- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
> +++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
> @@ -26,3 +26,11 @@ KernelVersion:	6.13
>  Contact:	Markus Burri <markus.burri@mt.com>
>  Description:	(WO) Attribute to trigger an internal timestamp event
>  		Write a '1' to trigger an internal event and store a timestamp.
> +
> +What:		/sys/class/rtc/rtcX/tamper/status
> +Date:		January 2025
> +KernelVersion:	6.13
> +Contact:	Markus Burri <markus.burri@mt.com>
> +Description:	(RO) Attribute to read configuration and status for EVINx and buffer.
> +		Provide the number of stored timestamp events, the current EVIN pin configuration
> +		and the enabled/disabled status.
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index ca3a19162..350cd92d6 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -84,8 +84,11 @@
>  
>  #define RX8901_EVNT_INTF		0x47
>  
> +#define RX8901_BUF_OVWF			0x4F
> +
>  #define NO_OF_EVIN			3
>  
> +#define EVIN_FILTER_FACTOR		125
>  #define EVIN_FILTER_MAX			40
>  
>  enum rv8803_type {
> @@ -116,6 +119,26 @@ struct cfg_val_txt {
>  	bool hide;
>  };
>  
> +static const struct cfg_val_txt pull_resistor_txt[] = {
> +	{ "no", no },
> +	{ "PU/500k", pull_up_500k },
> +	{ "PU/1M", pull_up_1M },
> +	{ "PU/10M", pull_up_10M },
> +	{ "PD/500k", pull_down_500k },
> +	{ "no", 0b101, 1 },
> +	{ "no", 0b110, 1 },
> +	{ "no", 0b111, 1 },
> +	{ NULL }
> +};
> +
> +static const struct cfg_val_txt trigger_txt[] = {
> +	{ "falling", falling_edge },
> +	{ "rising", rising_edge },
> +	{ "both", both_edges },
> +	{ "both", 0b11, 1 },
> +	{ NULL }
> +};
> +
>  static const struct cfg_val_txt trg_status_txt[] = {
>  	{ "EVIN1", BIT(5) },
>  	{ "EVIN2", BIT(6) },
> @@ -632,6 +655,16 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
>  	return 0;
>  }
>  
> +static char *cfg2txt(const struct cfg_val_txt *cfg, u8 value)
> +{
> +	do {
> +		if (cfg->val == value)
> +			return cfg->txt;
> +	} while (++cfg && cfg->txt);
> +
> +	return NULL;

Maybe return a more human readable string here?

> +}
> +
>  static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803,
>  				      enum evin_pull_resistor pullup_down,
>  				      enum evin_trigger trigger, int filter)
> @@ -935,14 +968,87 @@ static ssize_t trigger_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> +static ssize_t status_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	int evin_en, evin_cfg, evin_flt, buf1_cfg, buf1_stat, buf_ovwf;

> +	int i;
> +	int offset = 0;
> +	u8 ev_pullupdown[NO_OF_EVIN];
> +	u8 ev_trigger[NO_OF_EVIN];
> +	int ev_filter[NO_OF_EVIN];
> +
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
> +
> +	scoped_guard(mutex, &rv8803->flags_lock) {
> +		evin_en = rv8803_read_reg(client, RX8901_EVIN_EN);
> +		if (evin_en < 0)
> +			return evin_en;
> +
> +		for (i = 0; i < NO_OF_EVIN; ++i) {
> +			evin_cfg = rv8803_read_reg(client, evin_cfg_regs[i]);
> +			evin_flt = rv8803_read_reg(client, evin_flt_regs[i]);
> +			if (evin_cfg < 0 || evin_flt < 0)
> +				return -EIO;
> +
> +			ev_pullupdown[i] = FIELD_GET(RX8901_EVENTx_CFG_PUPD, evin_cfg);
> +			ev_trigger[i] = FIELD_GET(RX8901_EVENTx_CFG_POL, evin_cfg);
> +			ev_filter[i] = EVIN_FILTER_FACTOR * evin_flt;
> +		}
> +
> +		buf1_cfg = rv8803_read_reg(client, RX8901_BUF1_CFG1);
> +		buf1_stat = rv8803_read_reg(client, RX8901_BUF1_STAT);
> +		buf_ovwf = rv8803_read_reg(client, RX8901_BUF_OVWF);
> +		if (buf1_stat < 0 || buf1_stat < 0 || buf_ovwf < 0)
> +			return -EIO;
> +	}
> +
> +	offset += sprintf(buf + offset, "Mode: %s\n\n",
> +			  FIELD_GET(BIT(6), evin_en) ? "direct" : "fifo");
> +	offset += sprintf(buf + offset, "Event config:\n");
> +	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "", "EVIN1", "EVIN2", "EVIN3");
> +	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Enable",
> +			  FIELD_GET(BIT(0), evin_en), FIELD_GET(BIT(1), evin_en),
> +			  FIELD_GET(BIT(2), evin_en));
> +	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Capture",
> +			  FIELD_GET(BIT(3), evin_en), FIELD_GET(BIT(4), evin_en),
> +			  FIELD_GET(BIT(5), evin_en));
> +
> +	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Pull-resistor",
> +			  cfg2txt(pull_resistor_txt, ev_pullupdown[0]),
> +			  cfg2txt(pull_resistor_txt, ev_pullupdown[1]),
> +			  cfg2txt(pull_resistor_txt, ev_pullupdown[2]));
> +	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Edge",
> +			  cfg2txt(trigger_txt, ev_trigger[0]),
> +			  cfg2txt(trigger_txt, ev_trigger[1]),
> +			  cfg2txt(trigger_txt, ev_trigger[2]));
> +	offset += sprintf(buf + offset, "  %-13s  %-7d %-7d %-7d\n\n", "Filter [ms]",
> +			  ev_filter[0], ev_filter[1], ev_filter[2]);
> +
> +	offset += sprintf(buf + offset, "Buffer config:\n");
> +	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Mode",
> +			  (FIELD_GET(BIT(6), buf1_cfg) ? "overwrite" : "inhibit"));
> +	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Status",
> +			  (FIELD_GET(BIT(7), buf1_stat) ? "full" : "free"));
> +	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "Overrun",
> +			  (FIELD_GET(BIT(4), buf_ovwf)));
> +	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "No of data",
> +			  (FIELD_GET(GENMASK(5, 0), buf1_stat)));
> +
> +	return offset;
> +}
> +
>  static DEVICE_ATTR_WO(enable);
>  static DEVICE_ATTR_RO(read);
>  static DEVICE_ATTR_WO(trigger);
> +static DEVICE_ATTR_RO(status);
>  
>  static struct attribute *rv8803_rtc_event_attrs[] = {
>  	&dev_attr_enable.attr,
>  	&dev_attr_read.attr,
>  	&dev_attr_trigger.attr,
> +	&dev_attr_status.attr,
>  	NULL
>  };
>  
> -- 
> 2.39.5
> 

