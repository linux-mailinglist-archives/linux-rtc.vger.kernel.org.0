Return-Path: <linux-rtc+bounces-3909-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF86A846E7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 16:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F4B3B839E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 14:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BDF28CF4F;
	Thu, 10 Apr 2025 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Uw50905U"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2088.outbound.protection.outlook.com [40.107.105.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CEB28A40A;
	Thu, 10 Apr 2025 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296404; cv=fail; b=mFTyEJt5SavrmKa3anKDaAxshKVlZ7L2SQ2guGa/4eBklpbavmVnlZ+ltSKYcLWZdFumClqPhaPnjK0aCExWBOJ3OjSA77rRGBW+hDevtXbn/LXiChPq4LkOcqxzfMZLcGXlZGI3/jWDrjRMBCHDg8/zIZIjr5ka6FiHW3MUZXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296404; c=relaxed/simple;
	bh=FC02fWH4iAKVq9VpbqOYs08qVMbjg87jXdzX3ev8urQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iyz7+8rAOucqBicuA/0b0R053hSk+kJwGfoTdxMFkS9KhQsy7dGrWtiipk7QP/Tghy89WOjcOA8FvntRDXhBR+hvFpgFBgraa4NCMbalqEf4gAk8+0bIY0o207dR6mvvcjTZ1Xtw4emntywdl+lSRtZYBb4jpCeW7VM6jg8y8tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Uw50905U; arc=fail smtp.client-ip=40.107.105.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7Eqy2FSWgfWVRGkBmxJrjtQE1pciWV/2EERV1NvsTApzeTX7SHSYobWBfnS0PfkCx9bxYcVMRb5MktBDIdRWEecNCvH9sdxgLrAYThAd7qnLYvRuKNrYJNz9CGEFtB1Q7CHohp2ZPejnVSCMNQH/V6VqSEkaKQMqbR+mE0v7ORQeKqfAja89YfAFRQAlaTPgpq5JaY18jcArs+AUESNg/1H5gTPH8QF04INmbLnpqhesWueuuw5KIQUMSmVBL9jKghJyrQIOLJLQIwGrYraFdpOjqBp8Sf4mIFbfaG7hcr7jnKuwrvOaYH6nZdyuWVpr77GHfKlkhrZ7PrlY0Rm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbifKX6npeSFqI8sf5HtuDdI4BKiIwIsa0ALvTqpMj8=;
 b=Y3QsCTQkcnwDeytnmqdrvYPmcxGAVnmOBfGhWHWbT7/LrFzzoZmugya8g0nhSvASunzblHCPER2W6K5uvs2S2ZDgxabt1GFmkx5ee8vE/MNVPHDfzevoxjhEQ1ZoWL321KcXURmO38E4n9sO9lo27IiZUlPQdkaHiDQVI+2ZuqdaGu1xIx08WGMmoZxkFSJ2p5RTg3XCaZ6G6BS1/n7x+jKjVe5h5frT5BHSzjRk48cNNs5HSXENobikjOQqkK2ctaM5hO3xoguKt1GIjiwvHjkjiLWB9aDWjUlJfcr+TYxt+vewLbTZ84jwP3m3uIQl0c49eoL+XmPe4ELUo6eQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbifKX6npeSFqI8sf5HtuDdI4BKiIwIsa0ALvTqpMj8=;
 b=Uw50905UFs0s9bcnsZ6SDCnYbWaHMu5bUPH8j7ClwGw2VFzF94RQeuuV2ncVtVXNfOYMl+7QEv2BVDQd9hDKblPYiQCskEMMcx8j+A2L+qyR39lfYBuwkJNW1BUKw0EitEL/IPdSyidLQLbR86MNIClT1vvN30A3N98GMf3/5kC1ubFqCAsaguOxKKNl1xHm1nATCM0Pg9Ksl7j9kTSVYppnp/QYvIAan9LSfvGhOOdpsC7tYAB6KxIdKniVnRUimEwQWsd2HBpPPfDHcmwXcoycEFRGUhlJjIV53WfmfKg3Vt3dX9uitSE5ouURCjKxmYssnUnlkgF6Par2MQUtgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7709.eurprd04.prod.outlook.com (2603:10a6:102:e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 14:46:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:46:38 +0000
Date: Thu, 10 Apr 2025 10:46:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: nxp,pcf85063: add 'no-battery'
 property
Message-ID: <Z/fZww9TDLhm66O3@lizhi-Precision-Tower-5810>
References: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
 <20250410082548.3821228-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410082548.3821228-2-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c1300d-32c3-4220-9b6c-08dd783e7f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XZMK//XJqouc/BrtiF60spMTbyd30U4dYaMe0yHvjZGesQ32B6FMAsNU/RRM?=
 =?us-ascii?Q?WhJT3Zh34XzpMvGdV1ISU6nfRU/cLtZRkPU+yctgG3Kf7fEsQhQ0z3PMLcW/?=
 =?us-ascii?Q?qGaq5IsnBH+7+1mNBTPWXVVtNiZMqYLv4NefyUYqQUfoHPUcz9juyj3JnWgZ?=
 =?us-ascii?Q?01BCA/ya/FiN0O/tvB0duicxzO1g3JCuu9zDYT88M0Uz5jvQttlw0pmPKNnu?=
 =?us-ascii?Q?yowAMPRm8hxqZUAXZ7euFT29Zx0diflHJgtHAKLjvFN8eMZQDvqQY5FR76Xt?=
 =?us-ascii?Q?S8EZQ/7AazVP4g2oIWln3Ma/gp75LLR9h63GIBLIOLsa1pDKzYbxvZvl1Ic/?=
 =?us-ascii?Q?R0zHZPhgim67AdQ+o8wCffHzh+l/r0ZGMY7Wa2YljTvlsxz9IkZIvHoTfMkc?=
 =?us-ascii?Q?L3S8Q6TH/e6Fnd0+JLsPTNLHci9UQmSGADXkNXw20x+Lc0gxDGjWD0D91iPi?=
 =?us-ascii?Q?L1/0va2scqe0LxKNkpb00DbmYNBDWYixP8wPwxDwfcT7i/ygeiTjlEpJg9I2?=
 =?us-ascii?Q?EOFaAlHd8QLnTo/yoMwUBbgbW5x9/UWQDeUXXCEMsMhBH5cLMee5n6XbrEQH?=
 =?us-ascii?Q?trAk+1AemcUeL3aAzm9cq+mZ1sffvT91zVKk+cI35auTysFiEgo24C94mIMM?=
 =?us-ascii?Q?5jfn/w1NoBneZgurEevuW8nb9oTYPGzvnkWBbQjEDj0KKj0we9rAQ9c+rrYS?=
 =?us-ascii?Q?+dWoKPqqC5dWpY9+1HUsnI/SCkhA3kxEmehHINy0MXXWHQzSzmbA1cnyVnZe?=
 =?us-ascii?Q?/4II6Q7LDwMOaSmA61xqI19UBPWRC1SBsv6npdL1P8vWMhdJZMiQc/8b6tw/?=
 =?us-ascii?Q?3xntR/irVqZMQ+Y/O/5cLvY9Oe8OsPRdfMHVFThZZ+Rdl+AtBACvun1FXwHp?=
 =?us-ascii?Q?U+KFSS1KTlif/Gn7zMuCLF/bLyBxlMbpVXFe71bPCBtBd1aV5enpjWb7EQKt?=
 =?us-ascii?Q?E3/M9zSB3TKwgCHneCKM19JOKFEtlNxsS9/muFQnD8ejlAtJ79xwn/vrQbEj?=
 =?us-ascii?Q?P+fKt7Hd7p/g6gHwz2EJh/jMawWEz8K9AWLiVmw2ErfAJ9EfHPj7do1Z+6s/?=
 =?us-ascii?Q?iPXFG7bamh9xRQZkRxgzP0zkbSOIV1j38snwN8cp3IJo1SU7BiH92E9pnmoG?=
 =?us-ascii?Q?0L2gRjw98c7V3Zx+JqlOSLTJjRrInq9dpiUrDjsJh6wHnabv/lRYy9iqwlQi?=
 =?us-ascii?Q?1Eclt1CjrtWZBdLaRMJxSRGRnU0OY90nET/XUqazltvd58TXohvY1SmOmJVE?=
 =?us-ascii?Q?6AC7LUMwBaoxlCuDL99vlnQtiH7VcoRLm3ICKLoaherMpd9WcYM3+jjKp8Oa?=
 =?us-ascii?Q?Za+u/GRXS5Ar/TVhnP1ZMhPZV59zw1qah3BRMvEZzRbACuIf1hmFHcYn6zll?=
 =?us-ascii?Q?6Ng8mrFpf/mEg1UvW6cwlDHSGPFmYnZLhC8Ys106PDJ/oiBjPgx21aSKNnqF?=
 =?us-ascii?Q?dQNWpfYt+f9RYlpJde1/+N7E2ifEYd8nXcUBso2fEeGNq3SaUtjMa3kH8wa/?=
 =?us-ascii?Q?USCPZL87K3eZbEQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QjsfWG0teOwQqQnq2oSQp/CugjtodzrfwujmYZb8TzWb0vjss10GOMa3CQkA?=
 =?us-ascii?Q?NDcQj8QXbUDgK5pNEmEFaMmsU380vGar1Wsg0riR17sQYaJgRGxtdvx7I6Vg?=
 =?us-ascii?Q?j/zrhyJNx9RFcIKaR5X2WnkIaXDMhjS0eBwYQeHKWAFNzCbOm4ywiCBbpBVY?=
 =?us-ascii?Q?3NbKskimcziihC+pimFD18NCKVlD87LtHm21nAYnXaTOjJOTLbXFE+FhM//J?=
 =?us-ascii?Q?niyb1rFrr41KjzFr8Jbgt8A3L9k7hzlX1IiJNQy7BNkVHBUv0CblNFhJXwdd?=
 =?us-ascii?Q?rUbP9XyNnSL3oINiWLarJKovmvPI3DBj7WcLCgpsjskbV9mmPbxWAmP0gLim?=
 =?us-ascii?Q?XjILxSgtqL99Ahv4NlcYQvxIOvHLlyMbquJS6uTn2EBcGvdAdd6y/jKQkkyF?=
 =?us-ascii?Q?cFeCyFsZMGHx/lEu+LjLfKRiUMi7Q5k/EVjUFyocBfvkVf9XWPziQus5twLy?=
 =?us-ascii?Q?SrHBOjuQSMTlUZuUo7oi8VlTZt9N2ApJZusGR67jjFXmWRFtFilcnfDYoZrR?=
 =?us-ascii?Q?2YJDdVJYjb89aciqlWWS2hUgaSYyLemV656MiZAZLFQhjWIiMq8lOUeS0us9?=
 =?us-ascii?Q?laEHkDVTAau4YLQ6UVERypflyamSLIYNq0clT1dWoPtV8yV3xyzVzmBpegyF?=
 =?us-ascii?Q?xLt+7OT52gQGs8ERFjK7hAoUTBMpW4NKEec7AYE0ec/XZJr+WQ0wy0BujORE?=
 =?us-ascii?Q?ubXIfMu2eEjO2PqFcj1eU3Hho3lFeQGyWkce4TRl5U2dl7qgB7GtgS1NihCj?=
 =?us-ascii?Q?T3ZhYnTziuafL68MvI9GXN/GAnw3hy5V+6XdOg1Fmvs9PPiUPZDJndVW6Boj?=
 =?us-ascii?Q?bt53cDN7CBO6mfVV+TVjgvWe2jeKeTTnDww1hr4yhZMwhJUWpOW/YeVQOfmZ?=
 =?us-ascii?Q?yHrWqA+yukpYWHhmyEoEXFlu48S/lM5XlZm0VrSQ8J/9R52QV2MznXlhJ9SC?=
 =?us-ascii?Q?YOesbaYc4hSEwgiELImwkLW/tdIsH8s6ygemeXcMxWjtWTn96KcK/JmWOjSF?=
 =?us-ascii?Q?N7plh1xy6uTtsmdq8VsvhLZrMw60XQ0S/5+vqcPT2EAOvYtBnTGMurSOGOUk?=
 =?us-ascii?Q?dRYfkcPEXJBf8LA0BRijjTbm7dK9POLoOJfHqys543hxjggr5ko87t6Vnfq2?=
 =?us-ascii?Q?7Orjo3582nvlYlGIIha3l2Zk0sBMm9Q2uT5yoYKw4CHGdBVI7btX+QFqedFk?=
 =?us-ascii?Q?NiMk4VzgSnPY/hG+N8xkLpoKPIt5epn31RzEzTBw4M8Mv1TjaU8up8ZsVW6P?=
 =?us-ascii?Q?NkFv2/qn8T6OF0vuTMGfAshatKJ2Kaq5yGZOZLM3hQxn/wYzLgVddn3feeT8?=
 =?us-ascii?Q?p+HWdEfRyAZVQCOpHCvn0f4evMIgjNdhBCyyTLZvx4zGaxqVJ52CfxQbp6Xx?=
 =?us-ascii?Q?jfOAKtEhyijybZ73HSK1ZxcBoPkZAeqGZJxhlKCguCkF6zMeJWOotWH1vJXL?=
 =?us-ascii?Q?frlmgNrqdvfupYnxblImohjm5RTf1zSmyjv0E74H+BNcfyWk7M4uKsC8J8fm?=
 =?us-ascii?Q?MAApv7e17fHi5NBsr5NPm6zhZ/WK1TmwdWXaDq1X7HPRaTKb0QTqfJMG6w9m?=
 =?us-ascii?Q?sNAojpaGIiaVLQ+/Y6ZWe/V8wWpUOjdL9ENtEfls?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c1300d-32c3-4220-9b6c-08dd783e7f91
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:46:38.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh7pWcL5uq0xEf0kiMxggbcXkhmAn8TvXI6qx0acFkfFPQK3djdlBuh906Zj3gAW8xwgEQrB2bgxVYfRRbTgWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7709

On Thu, Apr 10, 2025 at 11:25:47AM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> In case the RTC is not linked to any battery, the oscillator will
> be stopped at startup, triggering a SW reset command for the PCF85063 RTC.
> For this setup, introduce 'no-battery' property which can be used to
> manually start the oscillator.
>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> index 2f892f8640d1..b342eb13fb2e 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> @@ -36,6 +36,11 @@ properties:
>      enum: [7000, 12500]
>      default: 7000
>
> +  no-battery:
> +    description: Used in case the RTC is not linked to any battery so the
> +      oscillator is stopped at startup.
> +    type: boolean

Can you use optional regulator such as, vbat-supply?

Frank

> +
>    clock:
>      $ref: /schemas/clock/fixed-clock.yaml
>      description:
> --
> 2.45.2
>

