Return-Path: <linux-rtc+bounces-3236-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74BA3C3B0
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 16:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D907175629
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 15:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0471F8BA5;
	Wed, 19 Feb 2025 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="lU2sczDX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BDF1DC184;
	Wed, 19 Feb 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739979158; cv=fail; b=Tis+JIbdGygkUIOHCkNILO8mxtA46wSMQ/2il7vTRoU7y+gIuWTRtqgpDm/gpfHrCvcoOA4V2rpadj9wCxoMZd1d9Objjc1lafxi8jTDNQFoH1SR70Snf3/B725s43N7spWYWEzs0z//mn3Ov1UJAUcVkGys0eMTHVkobeKv47g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739979158; c=relaxed/simple;
	bh=E+lpo0FUQhsYe3CZZPdTBwLRCvpbUoh6BgrV+FqE3jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pf7BRIOLFAR50PCBPicZ+e0ghbRsMUJj1w6qDI3cWYCtmy3DECevHK/GWnoRU2usMjCGZnL2dKo6/ryVfEPljtkc9lZCsD+3SVZWpY0pQNsyujch64mrlzM1LDGG9UDW9hpO/visKQaiNjFvz4e7e+JCUM80RRdDYBuustSMaWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=lU2sczDX; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbA4G0uBW1TEECrPQ9oWwyCVK0eBbTeLn/S6I0HDs8NQok/san/ZkCJE5TZ45JMT+dmcCx8+kO/nS+q+MzGkX7DWPrN48O0n5nRP6RzSm/+W/ZyJmGK13d0UiD7fm7nkAgfxI0ABV8aXNpZ1HuMWLkVQ+R7ez8FrsS+BNdckb2t7oGsRbISQgzW/KbCrtav1ec18uXYFp+k8bTRmp7hCQIwJfuqIZ4zf+DRkfk8+p2ZVTKZ64y/WI4f5Xr1veBVjALGb2yuAR1FzBZfEOupIyIfX3fUIrPmjYtTi+OE1lcr7H+Hvj9uuXqc54gR/orl0r59tf7LxyisKVEDOliCmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJj31/nsRr5XzLGVBxbfEsL+5sgtLWHmAFVJZj71K0w=;
 b=DzfokUQwad6b0R7209fACoMlQQCHZO66yZXMJ/URKbTt8GeP9epuYcLuwPGr8IR+nyUgu5ChHg0MPwm6gT1EdrnHJ/t88aD9VLA8Bse0rzc+wiqou7PXnltBRoTE/XpJS2F0VxdsbrnSsGGhbwy3pldk2Kh+dh3sW22ULIFp5XjvQWmgSfjk3oddGhBNbDn22ndr5WujPvvUOyvN3VSlvPPtQ57NPilQ1bMJpLdAwskfrQ2FWyh7DZK6nsRgB3wWzJJkUDM+Ar+WkTHWqpaRfQV5//GirvZ1R2N0B5jWOg6WZbQ9PBJjcrQbJM5OsLd06BCsjJl05L3nI+4OcUCkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJj31/nsRr5XzLGVBxbfEsL+5sgtLWHmAFVJZj71K0w=;
 b=lU2sczDXDaQ2cR91n6Wsm1mVRHXatpjh2Kh8s000+TiiFShAvdx+aYMHjdrgUXjdtSLWJnk05b5abID+YPZGwPPDzjmnHpr0T7vpxinsUyM7YXjXYx+hSiTlTyByiucNf3cDns9sJHerfIdmX9HuEhIbIQ7pwsD9UeLiJSRBsXEUZaMFSLM4Ra0OfTKPX0Pbuk0dXv9QE6CEuvr6Yb2Xtt3pJWs4ClYYD4Ld2LiMk9SmzBbzfx1+wzAtAHWbaJaSaKxsjDAa2zLHKvNSa83DjHDquO9gNt/Mcpmg8P95PBT9f2IpoSdMSHEFL6BlUCGXgg8a11Me7NP9sQkiP/KXkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by DB4PR03MB8660.eurprd03.prod.outlook.com (2603:10a6:10:384::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 15:32:33 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 15:32:33 +0000
Date: Wed, 19 Feb 2025 16:32:20 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: rtc: add new type for epson,rx8901
Message-ID: <Z7X5hMqiYgEHkBD-@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
 <20250116131532.471040-2-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116131532.471040-2-markus.burri@mt.com>
X-ClientProxiedBy: CH3P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1e7::6) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|DB4PR03MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ee209f-a71b-40ad-77c4-08dd50faa0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9/Pt3lteKS+NaXsXodGYA6PYPuFjKMwDCN7fq6DhM9ycbTodMDVlTH+L1IOr?=
 =?us-ascii?Q?LjJLcm7wIq5XrvBUU2sVFEkOJn8sjhvGOkItzxxVV4ByW8vlxuG7kjx0LqzK?=
 =?us-ascii?Q?dIsvXdIOmDMyJ4g/hCxl9M7VRLL6XZpuWWdgYPzBFWMbLHX4NH1yFDP2M31u?=
 =?us-ascii?Q?E0Mz0xNzhrNFG/3qZY+eWRPtonpa8DbKO9mpjDUxp2bsA9X0O0JNxRfMwU2T?=
 =?us-ascii?Q?rPmQzwokuyfQ1+Hj/4vRrAgXWlx0Jao1a8KiTI6nkHv6zkba6KyT2M378h1Z?=
 =?us-ascii?Q?Ji1NJeRTM1esu8KZkkD6CsxUiBgA1MYe4HbhC0LU9qNyOD+YTOSukteiHf41?=
 =?us-ascii?Q?TXk6Pq4XeXrRDxX8TtrLfAdK/tjd1QvIFvoJXG5f3JfPsGuay5dWHP8ojKQR?=
 =?us-ascii?Q?CR2CE6du7+gD7/WyPzT7rw4X4DLa87ybulQGQvVEugCkA7SkZdduE7IkLd20?=
 =?us-ascii?Q?6BgGzuEOnCI/eR04EFELOEm3KN8f3yH6xBY48eJsQW8BjU7tIzX7TK7Obchi?=
 =?us-ascii?Q?IdQeFhRZv0NvpXGlRmOFszAX66Mtrss9BUcigzAwbZw8FeX/THoRrkOVuDTU?=
 =?us-ascii?Q?7vEkSj2DYq/KHrmhqlEMd72voFXfEW8raPB0NKUvRHE1R+RoESUS9JNocL23?=
 =?us-ascii?Q?asdqRe4+3rypfkMqj1bNMDga+VuS0jmw7uN6dFShzBc0/3O6yViM4haTfAY2?=
 =?us-ascii?Q?ubS9W3+/ka2TrJVYElHvyG/0R4z2PR0i/SICpyZHVY+zZBFKkhbbTONvv4yw?=
 =?us-ascii?Q?Bq6XlN7gZjjxrAixSPgLrExf13sZygurpVk6h6eF0LxqKebkS5mf6nvygbAw?=
 =?us-ascii?Q?UvcCA2xhK4QNb3rcWQkLs7vDBgAGnAmUuqrd7AutlYdv4Dj97riFYHaDDzkn?=
 =?us-ascii?Q?YpnemNXUYUj/2Th8N68ghQ8EZ3rlxi+RcrgenS2ctYMd1+uybIH+UekFauU9?=
 =?us-ascii?Q?BDqT8S3ApQb8ZbsiYGPGc2OmjXPpzzCPLFp+UFmZenltgWAdM1grk60WFJDH?=
 =?us-ascii?Q?tFu9M89OSeVvc8aeOO+U2glBeQxhy5XRbmuCBoyCr8dYeZiOmKW5VhKzgt0r?=
 =?us-ascii?Q?CDjIGlfGmz+NiDarMlNrhViRL2/pCYvjPCyyQJmKzw+TeMUsZrwIpXsZ49qm?=
 =?us-ascii?Q?KB3gZkCZA1uZMAWKscQWSyY0q7FP3zCnUjNv2Ij6j4Q+JhDsgTzhogdXFHqv?=
 =?us-ascii?Q?Hc3AuwqSHNT7UWOcjtqfhCFEbm9KIZ5KJWH6QnKRank3SNRwsH7xSA4fFx00?=
 =?us-ascii?Q?fiATqjDueEA+EyZx1KzdKALI3ckvx1pdLAFdn2jaj2muh6J3i4D5YljkT/LZ?=
 =?us-ascii?Q?gMx86WeUBHNujaS+5CWES9+Nb3ok6stSAzKsvUfDbFBAxtVQC9l0pT3Qk3ki?=
 =?us-ascii?Q?5eTkb5t2uyDmq3d0ZB6xUiFSBWZxmbowaQ6lm+iLwCASVL1JSmWUmRkTbNkg?=
 =?us-ascii?Q?ydxKG8xr1BPe+xVGgJwdyEhjoy8pvFB2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xLntL4aegzE7wBmpWveecbh6ZQHIyf7d9XXly/oouzQwhB3lozhjXl5MKxH2?=
 =?us-ascii?Q?S1sv4fjujL7y1fPTyMUYlV5PxWJeUge3f97IuLBCIeMxFWP6AR6lK5w6XmaG?=
 =?us-ascii?Q?RHqVdTYuKZ/1Eq+s7hNA94gayZifHoT4IUHUwbCG7P7LC4YJeHG6Ny5R5fzJ?=
 =?us-ascii?Q?M/NzRRKEgkgiMe8PipvXDNzxnE4cAAPnnD6ZhmyATUdABaHdHBomSKQBnvnk?=
 =?us-ascii?Q?QWLUE+1GoJbEksGnB4vc5tEJZsg9vWMOkb9+e4r+uLh+DRNnIoxG4uqZfbJr?=
 =?us-ascii?Q?4qL7yKVt+IRj591zKnZq5GkbIE1aNKCYjbjbL+L9c/cQmsTzVV+hilXqBQ9Q?=
 =?us-ascii?Q?LWt2NHW+ecbb5zpIAfrgTa74+UR7n73Ouj5i47HhTOnvpHBxiI2O8lTHeMmp?=
 =?us-ascii?Q?SDHGbL+FglqI3iiykhHFElpwV5eATgxVHD41gBea8UlwCwBIqf/peWkra29M?=
 =?us-ascii?Q?WfD1C55+Qzdz78PyyP8Iev2mcPdv1FUOM+F4TBciN5faPzUae5ZdPdFFrWdL?=
 =?us-ascii?Q?wjMfmCf2EE3E7R3FAsSgG9E029OgJKUda6lnL3vrzdq75gZwWbTJiu5+rCeF?=
 =?us-ascii?Q?wkBrnZ4RNc+r90oR8uuEu6onpLbqIbFnGsoql1ZbRlGIhFcymgLU5yvTNnV4?=
 =?us-ascii?Q?srInjz1Hc5vXz1DQKJSUQi1ukGHzUKGf3yeLvAbQf+/CKJarYRAXTVFrA3/3?=
 =?us-ascii?Q?gwraKrD9fWDWwmOwjhC2nrrbvrP/e3c3aiaGf8eclZ8hT0TK3QNTjcPflMJX?=
 =?us-ascii?Q?z7uhw4evPHnZJU52T2RAY+t6PLiNVJpSg1M3sJ8st8IghjUBvvVQt16jr55d?=
 =?us-ascii?Q?7UqT37kiRad0bufaHJchH7gaQ8tXKqN7jl38RxdL8PryZ1j36yjGrx1Cb6X8?=
 =?us-ascii?Q?mR0Vf9/uceBqFpz073BmWvUzLhDEgPOuNgcyQ8Kgtu+foaHXP2mpybNWruu3?=
 =?us-ascii?Q?V+lPFott+o1k3IPUE4JjhoG5MKfkaFQkTEexmXE7iJfCqAMOL1cdQbOhBsdk?=
 =?us-ascii?Q?viivxsf5H4Fk0KxAfJCK2dCHqSbS6UoaQShk34wFLIAU8DoM4vKB7xfudqk3?=
 =?us-ascii?Q?DoFtZXtlBRX0SX7dzH4xliydoGoBj3QOmS0viAkDYV9/i2vVB80xOGaQ5m9G?=
 =?us-ascii?Q?KCKdRefpARkC7T8EdZ+sQ9CBx09pApoauv2aW9bvPmiuP7QP8EjHLDYnQYVo?=
 =?us-ascii?Q?FS2A0xJTGRREB4YFjvhZWRkqcppnM1okyoYQFb6U+9O6nStAEQiACGo4hyzq?=
 =?us-ascii?Q?QZvJ1vXZvf3GXYEUkM+O8pHj1Okrq9bUSuAirwEqlQfeblhHzT1Us9wC2woO?=
 =?us-ascii?Q?fPvP8q1V5/3gBxlA9XV/Tfrkzx7W5Kw6cVM71ufea/M4RXc7JNkNIkrykHiC?=
 =?us-ascii?Q?681Q7wVEweVMxpHuhoDNBjnPeEAVuY7pOmPfZQu5T9mQcl2d3ramH02Z8yr+?=
 =?us-ascii?Q?lVEDSqxe3CeGzpno9jqHnL/U5vVabu7b3Yx3IVZg8lFFV9aTrSXq58zUZMxV?=
 =?us-ascii?Q?U65HUubKQ5ZQgWjBDKtuk2jmhE5v5lotUxR2UKDKfbocldVZhhXiuRywFpLQ?=
 =?us-ascii?Q?v1hVS++ppOuKtnVE1hcYxdFfE9H33FCsMXUuqupR?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ee209f-a71b-40ad-77c4-08dd50faa0f8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:32:33.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vz+w/3q0gcQH73afqiA1oxh8IpKmYswxpp687b3vPq2DagTNGRb1N0MIQiBS/VtHX/AQkPgwjxh/O5AVo65wPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8660

On Thu, Jan 16, 2025 at 02:15:28PM +0100, Markus Burri wrote:
> Document compatibles for:
>  - RX8803: already used by the driver
>  - RX8901: new device supporting also tamper detection and pinctrl
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  Documentation/devicetree/bindings/rtc/epson,rx8900.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> index b770149c5..03af81754 100644
> --- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> +++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
> @@ -15,8 +15,10 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - epson,rx8803
>        - epson,rx8804
>        - epson,rx8900
> +      - epson,rx8901
>        - microcrystal,rv8803
>  
>    reg:
> -- 
> 2.39.5
> 

