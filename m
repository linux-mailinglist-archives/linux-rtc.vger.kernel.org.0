Return-Path: <linux-rtc+bounces-4845-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2003B45A50
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 16:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7ACF5A7EC7
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 14:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E08C3705A0;
	Fri,  5 Sep 2025 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dGWUm8vz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9AD370591;
	Fri,  5 Sep 2025 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082204; cv=fail; b=bCtXqK74rXUTU8iM/vv8gOaVYTt/MrRfBhSTlPice0BzIwSWjBnMkYDhaPLt/xupmyqoWIMpobaQ4e3UTG9LsqbIsTr4eMB97wQorVgi+y9RPMi9kZlFF2HVSRDRwTVR0E9mBnjzHJOYPWRT8ghJZbPMfEnQRzonwCFG4FeMJko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082204; c=relaxed/simple;
	bh=pM2aVcrzbtlt/P/rJ5XfBxuFPYlOJrjVlqNH0f3Q1gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nxCewNZtrlqTpQNGP//HUrPl+KEpQv7yujTqbxrgq8urnMU8bfnbbVgGmVKv7hLea8zpYEYlK0JnWQYJvqBGkT4+gtMztNrDKCmEfga6gvs5W+ybTD81gw1a+EL7G6Imhr2JvpHMMKWPJ/31rQXDnWKH9o3NDbegdieuGxsfgqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dGWUm8vz; arc=fail smtp.client-ip=40.107.162.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSWbt7vd6bKG0gOyaqzdJUAabFTcji2YhCAsfHfOnFeOBc7+xl2HdP+upy5RfPoCeN80ANvpQ6zlLTZoLSinNsnH6qJ2PCHP0ypR4pAB17gjs4keD/t7PIGhA8ZPfGxJslDpmmNCvzGK6j8KxtkIf+tBNsx8+0F8RJCPKsoTAXqmtsbAZsif2dZBcSLZFlPzt3LFerl9snBCgdrhnQ1I7vsR8NOYLaaD/nWklfuo6aW2bw+kstLx4C0Q4ITvrpyZVZRVnIvGoeNKv0hnrjWWhd4cfNwywbQJXGBG+ct1WBeQ+55WouKLH5N6Gp4IpN1XC3Ln/n0mSM5jOQIbjfIn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYVTsH4evHHPhCGNZ3ZKM+ZCjXX899NOJAoxQFj6qBE=;
 b=I76tqnBqyh/Pl6HuA/x8w54PNS+V7LpKVddE7Mm39dDLc6UvvwhslFi6iMBwZqoL3YsyN4QREd8LiBHc7vtXXtTA6ISb6OG/WkyNeE33s4XV5mLA54Dy4qJ3NbRDVSD1rRnFaqDXbF4hsxUyAyx0Qzs6KKegEACp+LzTdqmtPDRioSdCzFtvgU0gVMNLzNT3HwWo2P5IRRyAVFHyPTT+u7Y/fpmCkKJvOL+8xdXqb4h5py7LXtqy7kFidKYB+AGp1wmA5icKPT6OKkOBZBjuhdHO7UBOhNRfYbq6k2tC+DWMGk93VkOy6rTgRsPH/eFFUYCInnjqLnub1q+yJVnUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYVTsH4evHHPhCGNZ3ZKM+ZCjXX899NOJAoxQFj6qBE=;
 b=dGWUm8vz9xfWyHawXk5u0WDD5U8D/YdMt3lNCNqUpsY4PhmqINxyvldhlF5jmXzEqExjIHV4FWU9EwlNGsBX4syH0R5tKf8hTCcqJNwXcy/qukSGKuD5OHO67ptJPdg9bsMzrjEJ6X4U6C7SgXGkuuZrfjAEuZl1F1Gdftzy0RKEvrrFoft1LRvXb30Blp3o8a1634vQQmz4mwA7BjDVNw/Zi7z52T/SGn5b82B/HtjzttVSis9Io5ND0jNholwRQtt6nzTWh+0HmJEWjV5gWFDSbmEI2H1LIjn0yIo67yocb8t1ydYuRph5D2hKO3MB2YOiI6qC91pV2r2aOT3GDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9156.eurprd04.prod.outlook.com (2603:10a6:102:22f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 14:23:18 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 14:23:18 +0000
Date: Fri, 5 Sep 2025 10:23:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf85063: remove
 quartz-load-femtofarads restriction for nxp,pcf85063
Message-ID: <aLryTJZzKwI5f4oQ@lizhi-Precision-Tower-5810>
References: <20250903191128.439164-1-Frank.Li@nxp.com>
 <202509050718321ac264d6@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509050718321ac264d6@mail.local>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b45664a-670b-44bf-f344-08ddec87c25e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NgfMq81aQWnjieIs8RI2EUWYD2ffyJc6VNYXjLq4N1W74r+67j1R2unYckBB?=
 =?us-ascii?Q?bJINDv8NgTdn0pJ+NLwL9Ja6V6igXutgbdjymv2PEKaqvgqOZXpUqjuEqovV?=
 =?us-ascii?Q?CNZMgrbire+3k+l97mVSPLwr7H4wLI9Xhm1SyeH15Q61cnvHFKNBlWgJxf5K?=
 =?us-ascii?Q?RpsZIfgZtDw5bsa0Bp8I9xIfAY7K135fv8+qyq4OM03Od5KpaGGblnqJpROj?=
 =?us-ascii?Q?OAb3fL8VHX9nDvVL4LPOROj8dgT880H2Tra+AjLc2iXh0WXKLSu+xyB3fDbh?=
 =?us-ascii?Q?dGxg5UN7c5TTbzgTRe1RC4PtGzn9+eRQWsN83NNOxPZjJ5lWvtgQuJ6UmZI9?=
 =?us-ascii?Q?YiTmy0wysK7HqMmeWUrJUelTfVtmZD5ZT60N6/LQR07enH1kNtDbTYwXgzS7?=
 =?us-ascii?Q?fuZZ6cScwUY3dI7FFrpIynl7KuoWKkLWaBVCohvqGk/hhVkkpX4lIoLkUyld?=
 =?us-ascii?Q?Dwj1rcpuquigHvq35tMnCSqlGthoiGB6bi3n0fe9vZDNE3bl+AsrHzT1nn+A?=
 =?us-ascii?Q?f9oAM/GAS3JVqs4emvfgzocXeGpu+WZ6FfqEFM9vvULmntFGCymWy3lep/Df?=
 =?us-ascii?Q?sa2C+EqvlaXq4eaRUlQeNof/bU4JRc1IBA6qpmkiCad8fBdkXOqPx9uP55Cz?=
 =?us-ascii?Q?78mm+Ut7IzHJVtmhS6uAfgpgaYeKYR2WurxdTDcQVBzdWztqOlXXxgH8dZ1t?=
 =?us-ascii?Q?nUXqlJAt1mNA0Q4ukHTITDyT1HBmljt4ZcRm6lDy9phHOjlhlEb5KwU6q4rp?=
 =?us-ascii?Q?jhj8RUjff7WzRoMJktTDgAjpy08ooIEmIsYkoOT0dG0q4OrVIZNtvtOpGlyY?=
 =?us-ascii?Q?ZPNYYf5NXPbU/zVsWKSI+5+bUlBtjk49gVslVlMauafNqdrqTjnT8ZJnfq7D?=
 =?us-ascii?Q?5PHNupmZ0Sf0Y8MlkXbWHGTCfiUkbgxOtYjAsLnPr+eO6yPUiMgGs9Ao0hk4?=
 =?us-ascii?Q?TsY6s+oV7qH4byBJmGwZ5WhbUNrN+ieJ4wY2gZ2pg9OEbSX/PGaZbDGXkZPr?=
 =?us-ascii?Q?ACymOO/K1xJkhSRh5IjKv/DQk/rImfSxMQgudu/fM3f7HurFjvDk9o+biHLw?=
 =?us-ascii?Q?aOqxiPHk9lTBAF1Tryjdx0rVvbWcQ9daDWw3seHvwZC6bOQd2hzAYvfXCLL7?=
 =?us-ascii?Q?LGsSZe7qEdYQHg1eVPX+6axZl4BZS1AxY0BMrg6A4j7npzUS1e/IBu4rUcC2?=
 =?us-ascii?Q?nQGahxZbXDZBQnUyrEJEA/FgePqteoS45xhYUJMZKbecseoipNfExSyQzLRL?=
 =?us-ascii?Q?3i+R4kVrZUk4dyX/D9F9gMOjWFbPbjZDWM4UrPe+CHapxs/7tybfqvdgRcDh?=
 =?us-ascii?Q?1NoF6ll7yZn955a7d3xu2JDQMPSsTAPIaVt8c6A4x2f5HIyEA5HP5J16KQ3P?=
 =?us-ascii?Q?AHDBYCZPtMq+9F3tVFNnVv7uS/5vBSdO+WHOei61M4Ssezo3cGDIFqwr03Tc?=
 =?us-ascii?Q?thUt/kMs0Qs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KI0LPAWbSd1mI1jxkywLwafkugKtbEkDNyC6sx4rPJ5zqRTfQqbwDPp5J50K?=
 =?us-ascii?Q?V4lgmdN1miNZvyVPYLVkr1OGGw4TrYdx+KxSRVxJgwB/VI8rRvqhTl3nYm3h?=
 =?us-ascii?Q?ZS0grWUFG4VKBCe+V1SjF1L5tbl5pw9+WVwX3IYp0h2CjeJ331KErTMy5XAt?=
 =?us-ascii?Q?Y7dY8ews3VFW425QPG7zAzZELo9jaq4DoPf57kfbBZYIf/VCHEc4nSKaRgS7?=
 =?us-ascii?Q?DQAJiB+9/8fNCFcEYTAmqn9iyub5iZP4GETH9dM6+51zRsV9rYy0VnAMegRa?=
 =?us-ascii?Q?DkyKmvCqgYQINKhftbY7eAbA8GMEhI3acvhXiDuCbR+j25W9QFar6EvjHeiV?=
 =?us-ascii?Q?BKvouhC8GLncOB8TYQhM7j1QNeHQsHtwGyGvUl0H/o5YVtsVGfXbpVh6No+C?=
 =?us-ascii?Q?88Oca7BO7rAjsZpdY9B82pVU4hyCKKRsGULQh+XEzWSvSOgjEd6IFqFpQu5X?=
 =?us-ascii?Q?4Z3muMfp1THaJDtU7Jgtl+2CvuZa8MhNSjJWJCpVtpU3BC/OKIHokfkGyRsY?=
 =?us-ascii?Q?NQ63YfCi8OTBexmcL6MsKxYLuYv1W/GFqazYsCpW+kNfqE2NddIoveAwBp2P?=
 =?us-ascii?Q?/p2E7ePJ3exPyyWQOoL+/028qrZYFmzyeCcrP41Pjoa6C90/LuKFXvYpNaof?=
 =?us-ascii?Q?0bo7b5r1TVogWT/eVugtdbOf3O+y1jiWGnAJBm4dGmxarcUPGEtJ8TiraqPG?=
 =?us-ascii?Q?e0gJ+8qPO8fvw+fbWGmboopmzK8jBD23J8Tq4TyyG1aS2vWBUA59KnyFXDp1?=
 =?us-ascii?Q?h7KWfAAQVdAqnKYNze00wApZOqKzcVx2uGKy3v5nXbiEhOsk9D7SwSi1A+Tp?=
 =?us-ascii?Q?1ndrwowvr6vPz871D4eABGtOXa0eprr717dqqWSluAdDdhRXDoNwsbGCEzBU?=
 =?us-ascii?Q?M2g1UzbFF0QFzaZ6fDfHm9cKBZ6ZzRpPF1Vy8eiDIWeNG4sR7v13nKGyDI1T?=
 =?us-ascii?Q?t7P4A0zbbThG+kI1s4UEZnLGUy+LoV2U4Q5WGG/bg+0Lp/KF66WzD8yKOdAR?=
 =?us-ascii?Q?25gjt6xsi//SFGIoVP/yGyDP6f10/v+pfC8YsQjYLqBiiRudwo5N3CHxMeTp?=
 =?us-ascii?Q?Bzgs2TYr4AvYKLcvq+nEAR7jovW6W+NP8YySabBrtvsupq0lBM2aay1nf9kb?=
 =?us-ascii?Q?SP90RoAjOsGxki+zJUbaateKWOl66cmJi3PsCVW2iATFlbdTAJS7wOFP6P0q?=
 =?us-ascii?Q?CTA4PoroD45I4Y8pjJRkTGV7XBrqMDdVGJTNOn5am+NjhXq9/eMJ3LrP4WB0?=
 =?us-ascii?Q?JGcZ2KM7cOCzvPcGtLowpDFv5OSYkLJIbtg71KW5Zv4NG94f9T1WF0nHZa1A?=
 =?us-ascii?Q?co7LZx/hWZMmWn5JY0p3Z7wH6xK18wMedw8SArW50Yetnqxa5JP3mgr2xQcN?=
 =?us-ascii?Q?xo87ZlNSr0FspTnaJcoRhdC/jC3fD9X8d29VU/c3k3jg0cHIgxon1vK+cdqZ?=
 =?us-ascii?Q?xc53XTKlUIaMLxPe+MIzBOwo1JEVLadOsvf98e+GSjPjGvTF2Mvp5csJqwC/?=
 =?us-ascii?Q?2WyhFjkzkVBYqdwdkj9CR9sQnsTrzC+/ca5h6EEhmIjU0iRUQHnb3fIUNwSK?=
 =?us-ascii?Q?GEE5cbeeEdvY4nJ9gmg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b45664a-670b-44bf-f344-08ddec87c25e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:23:18.4191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2MpO1JZHPvFTalMvKc48Ure8u9Z+NgRcdeoPjjEtbRxN6h6BiLYQ9yHvhid+RFUzbbp9WxjteURnIy91E25nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9156

On Fri, Sep 05, 2025 at 09:18:32AM +0200, Alexandre Belloni wrote:
> On 03/09/2025 15:11:27-0400, Frank Li wrote:
> > Original TXT binding doc have not limitition about quartz-load-femtofarads,
> > which only allow 7000 for nxp,pcf85063.
>
> The only valid values are 7000 and 12500, wouldn't it be better to
> improve the limitation rather than removing it?

There are already have such restriction in top

  quartz-load-femtofarads:
    description:
      The capacitive load of the quartz(x-tal).
    enum: [7000, 12500]

This just remove restriction, which allow only 7000 for nxp,pcf85063

Frank
>
> >
> > So remove it to fix below CHECK_DTBS warnings:
> > arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
> >         from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../devicetree/bindings/rtc/nxp,pcf85063.yaml          | 10 ----------
> >  1 file changed, 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> > index 1e6277e524c27..f7013cd8fc20b 100644
> > --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> > @@ -62,16 +62,6 @@ allOf:
> >      then:
> >        properties:
> >          quartz-load-femtofarads: false
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          contains:
> > -            enum:
> > -              - nxp,pcf85063
> > -    then:
> > -      properties:
> > -        quartz-load-femtofarads:
> > -          const: 7000
> >    - if:
> >        properties:
> >          compatible:
> > --
> > 2.34.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

