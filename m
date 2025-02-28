Return-Path: <linux-rtc+bounces-3313-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA7A49331
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 09:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4185616D89F
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 08:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DAF242914;
	Fri, 28 Feb 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rBIF9OOz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2079.outbound.protection.outlook.com [40.107.103.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F2242902;
	Fri, 28 Feb 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730705; cv=fail; b=uZsC0tF0riFNyBeiHMp2DcqSPV9754/G01fIUcMTj7o1TkZWD6uZGHitPa5s8XMlEq+NP0mr8E2DhH2iywGGriSnFT87bkRNCQHxYlVD8JUGtBHLTF2eYxQH7oR6begJx0zjYpRqcmqn623QA3DzmczOK77dxkGJ6oxpuVRWMrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730705; c=relaxed/simple;
	bh=WcXGujbzEcZZPO7kxTssm9NW+b6NjsX0rAtRhtqKmGM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tcUHpelZBuoMKR//tr96Fzmlu7ZjrNPp74uap9YWJmCunVqb4500fia5n5Wf5sWJqLg6EKeoOe6vsaD7jKxThSlrzHdeHW1zqILnAz3pRnIBdw5wRn0uJBIMlzgTq/J2SiC3CZYcm1zutPDSzymOhgw3mZuBuW+4MV8zhZmmbgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rBIF9OOz; arc=fail smtp.client-ip=40.107.103.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfTaWQmvSQfRVeEkUd7cYGPuiiOIS3jZtkweuDJOTkFX41OPS+Q1ulYM8wk//Q7rVzydUrEwXRbSoBo6FVN+eSRXOdR8TAq2j4FKsa5u1mbBrTLmXNA5JbNrAs+9AnHCf/AFXrrb4Z8zgBIBxzUFQ1UiMERnYW5fl+CtbNcP16EbSsSIWQ08dnIm5LhfpmsfRxBVh7+Is7yvH57oMa7f7e//I7YhoepqeOIB7PAIIGeUdUI3Mf8UfdYpXGpuQuzHJ0eivIIMRyQVlgNsn0OoZhof/JegfPDYqMEQposKQQRbJXDHT9N8p39a5AZoFs2xdLbHj+ZiogyZt9hh+nzx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G7NN6Kl5COfmtpPduq96FDYZsNDDrMkC17nbtyCYNY=;
 b=WzknnWI+/AOSHogRBNdJKNP6opPeqqoj/JHl6TZ8lhr84YBeXtG6YNRK1rgB1v8fynGh1mKYZ51hszgqt7a6ApmGuue34Ks9nQr9gF2xi2jVhcGpcrLHyJohPEKn0LyVNFCXO+qtES6WBPh2kkczXOlCTmBYHWZBorAEVjh1g0+Q/WQtPeMO47wJUDldPVr8h4LwORHB2hbynPJMiST5F8A0T8MwzXq/6T8CQuvkN7mIXcZvVKfQT0v3SyaymsRqmy4tshqVqGTwshLnvZ/8erWVczK1II/8Z4mJzJ7/TOcE5W0+G50GF78wqH2WLASp71QkNjfI514MbTCrevBYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G7NN6Kl5COfmtpPduq96FDYZsNDDrMkC17nbtyCYNY=;
 b=rBIF9OOzdfRY6PWNtwbVQ+ZcwMFoNCCXW+1rodC4hooMPkW/NuD1f59xPUBph6lumeP/qO4zOTQWqPEdFyDi4VLgfN+6hnyl1OOPTNyYjL5HiNHGuaF39nF+PZAf4p+EKg3u36DIZDXjPObaU/4LcSQy3vWgLW9HJOYH8xN6RfS1dKZmL2vwEvD+4jhDW8ATn87K19tDMgEbeGYCmE5j/7YmlgdzIpGzDFnB1rEujdPiJc6wnuPbAu6TYxWklw++mjg0owGrhzCD1jWrEN3GhnvHOphhDTp9Fnn2qeDvRzFDoGFlkjTbLiyRvR00Up+Rgtr3uAKU591XJRmpKjhOcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7305.eurprd04.prod.outlook.com (2603:10a6:102:83::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 28 Feb
 2025 08:18:19 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 08:18:19 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v8 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Fri, 28 Feb 2025 10:18:08 +0200
Message-ID: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 536f13ce-411b-4146-e0ec-08dd57d0755a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzJXQ2hwcHoxRXlteFVzU25jUHV2ekJkSm5vNFBYNnVhZk8xLzUxY3pHUTIz?=
 =?utf-8?B?YmVRN0k5Mkhvd214VFdyZzg2T1NwejdjU3ZYZktZWHFvRVB2REpUcUlqbm9U?=
 =?utf-8?B?S0tjTXV0N2JMa3p3Z3NleWRmbHl6L1IveTNnUTJCd3ZRb1NNS0xPL1lYdlE3?=
 =?utf-8?B?Qk0ySlB2aUgzSGQwRHFML1Fnem52UFkrQis4NVVHZFZOa2N1YXBiRGk1UmJP?=
 =?utf-8?B?OHF6VCtuZDR5cGZOSjBUTnZzdnR0WXprQWVJYm9zYnhSQklLN3Z1UFdhVElN?=
 =?utf-8?B?amVQYmRBbisyUTBtZ0I2S3BXQmVPRTlBWFZ6TFVIZ3Q4bTFGeUUrek13b0pF?=
 =?utf-8?B?QzI5ZFhNMkxHSlpKaEJKSGRmNkIwUjN2RDJhVER4dzBwbmM4c2E5VGlFRmJG?=
 =?utf-8?B?M25BL2JRZ2FzdHdaYjVEY2RmNkZPVnc1cnJwenQvb0YwVXFGRm5QY3NXaFVG?=
 =?utf-8?B?dzhrbmJpUGVrNXgzdFBzYzFmM2VSYTBaWVpTb1VsWldGbE9IS1hOU2owN1Bz?=
 =?utf-8?B?cXlCaldzVlo3anhYY0k3elErYjRhV2VrZndCM3FxZjhNaFdva3B0K0R4UG5M?=
 =?utf-8?B?WnhmMTRjbG5Rc3FJdjFwTU9rNlFyWVlsd3FBQ0QrbjM2Y0h3UGhYbms3WkVY?=
 =?utf-8?B?L2FIeTlucmd3UUxaVHJhaFdBMVNGRGltdUdBZWFURmFDUXNMMEVvWmVTdjB4?=
 =?utf-8?B?UmpUM1VScDRxaGtsWmlHYjE5UzNacnNYWkIzdS8wWG1QUjBsTEtTa1ZjZDUr?=
 =?utf-8?B?UyszVU1UZ3BDdFZuU2p4ZmFzRmFwZUw2V3p1TUFtZzJENGJ4dk1UTDRqMFI4?=
 =?utf-8?B?eUVYZ3RVUEloQUFwWDZVVXZvOVVZWDVscWg1UTZNQTkxRlNFVjNBVUtEZ2VQ?=
 =?utf-8?B?dUhndFpWZ0ZYSHBaaHZOZ1JhZWNqaGk5VmhnNnBRbEFrV3ppck5UWTJJdTRY?=
 =?utf-8?B?SDYxRTh5THphSWE5RTN5NWtKeXZRVUQxQ20rMDlsR2dZR1NyQTd5TGo1Ym1H?=
 =?utf-8?B?MmFIdXBGVlJHdkVPdHl4NUVJbStLbVpMQnF2bjgySkdGcktoOWEvS1ZnaVln?=
 =?utf-8?B?T0JEMGZSNVN3OEZnVGM4VGNZb3lyM2JIRkwxQkN2a20yOW5USy8wMEZvRDBj?=
 =?utf-8?B?WWkwbVNpM0RpUFNiOWR0K1BaMnlmM2E3a2gwd3NjSCt3NUpTMHRHeUZJTXlh?=
 =?utf-8?B?WGVQa1VDeUtwMG9pbWMwOXRXYlVleFNZNkpHY3lKNHgxanJhSTlrV3lSWGo1?=
 =?utf-8?B?L21uTHVkRnc5RGQ0M2l3TnJ4V2JLV0NudVV6S1VvMHkvK1dXM2FtNGk4Z21r?=
 =?utf-8?B?MTZvci9qT05vTDNjK3B6UXhBVDFEcFBwYURmTXNFSnF5djkwRHVEVkt4REJ1?=
 =?utf-8?B?SWRWTndpYTFDWjR6UWZVUVNqTEYxZmJQRVhIeDc3RDBZWHNUNmN0MUdhUkFq?=
 =?utf-8?B?OFVXVDI1d2lQekhLcSs1cTN1eWJtNTJYOWtFc2RqZTVYOVRVOGp2Y3Vpamtz?=
 =?utf-8?B?bU01RWZhcEkvVU1Ya0hhTk9xTjJzT1JmeDg0bVVGZUhENDZrcm9Rays3bEZ1?=
 =?utf-8?B?VW5RMjZ5NkVNZzRkNEdVS2tlQmhtQkMxMGtNeVRKakpEa3ozeW42MUYyZC80?=
 =?utf-8?B?SERhL1hMb2QyVmh3d0t6aVp5aG1CZTZsdmk1NDhXa0F5VjIxYTVOejZWNFN5?=
 =?utf-8?B?TkZIeGxYQzRGTkNaWnBQdmIrbWx0elM2cUFIRmVwMWxxN3VSSTJscXppQ2VT?=
 =?utf-8?B?dTNNZThSMWlmVkxBZWhtKy9qU1JQdHl4eW9GRmJ0Um5yUXJMQm1HQ1dhU2ZM?=
 =?utf-8?B?R2VhWEEwbTVVcExZZ3UyRDZGalFaYnJVK1RXYUFJQUJod2VWVVg0NWRtM0JQ?=
 =?utf-8?Q?aZ0TmFzuv17TK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjBBS1dzWkhwbXRHY0tkU2NzYkJVMUNPZjhzNUwrVTQ3emJtcWtYZnRkZDlM?=
 =?utf-8?B?Z2hkMjJ3b2w3QWc5VGdxZS8rSE1ibHo1TGpHQWtvSUlHSjltaUYxZityWUJE?=
 =?utf-8?B?bnQ3cVhZU2NmbnpwendtYWV1TkJXS25CV0xydm1zSEt6azJka3dvQmw2bHdI?=
 =?utf-8?B?MVU5dytKOFh1ZlpIdVJieDZrckoxdHU1b3JMSUN2QjZWaDFyOGQyNHQ5T3Fp?=
 =?utf-8?B?VWtPNmd6ZXFyMTU5cWF0SDJRZSt4L2pQOU9IVzdmWTRiV0YyTDJacEdQaHdt?=
 =?utf-8?B?WEpUS0dnQ3JsRlcySUxTOHh2NndYbUNaTmF6akJzWVNVK3c5cDBWd05mbElN?=
 =?utf-8?B?Kzl4cmRNeUZJa0ExTWdXZXA3OWtzNmx1a2o4VWh6SFM3Q0NSTnpkb1dpb0dX?=
 =?utf-8?B?SS9Ca21sRWl2SnJQR0ZRb09FUCtsVDgzb1E1eVNiWFh0MjU0Z0x2UGdXYkI2?=
 =?utf-8?B?VTNWWjhXNDNiR29IeVp2Q1NBQzVOazMxZlRybEN6M0s2QXJReW1oWDQrakV3?=
 =?utf-8?B?TE1Udmg5RHVZT2pMVlhaUmdFMnhnNGVGNmRpekdWcnFobjY1bXo4TFNpZUQ0?=
 =?utf-8?B?UHVPMzdsTUlXMmFvaGoyeHhQakprRkdGN3lpM1RzekhPYjJaUmdlSlBZZVdE?=
 =?utf-8?B?aVh2UXRuQ0VCZ3FiNk5XZ1AxaVlBTTJaZHkxWlBrNUFpQWt5SUQvNDJXRGNY?=
 =?utf-8?B?djBkWDJrRStLVm9oa3JLRmZRT2xKaS9qS0l3N25oRitGa1RISytwQjFhZFZs?=
 =?utf-8?B?WlNrNmpqR01CZGloMFlKZkQ1NGZ0d0JTc0xjcWhvQ3FTelMvUlVIVlNSV2xL?=
 =?utf-8?B?RnpRZ0dHMVh5QURrUlVvRDhTNkFpRjNHR3VmMGtUbEY0U2VIMi93TDdOeG1J?=
 =?utf-8?B?WHlUQ2tkTXFrQmlNTFNHZ2xLTktFUnVPSVdVZ0pvUmViVHRXUXZCcitEL3c0?=
 =?utf-8?B?a1ViNVlnemFVMTlkTG9VelJpRzQxYnJmaFlIMEZISzhIbmY0QWEwQi9FaFpY?=
 =?utf-8?B?SHFXL2VzV0ZRclVKUTlOWGlZdXlJNHo1NFlGM1lEbldoeFRGM01XQ0liajN2?=
 =?utf-8?B?N1RWajZiVlBNN0krY1A3b0oySkVzNDBhZWtiTmVJcnNtY1lPc0x6dW1GNGFQ?=
 =?utf-8?B?THBZYVN6cnFlOVY1K2h4bG5POHZOWDcrTTdBZ2FBUEFLZm5maEtreTNGdC9x?=
 =?utf-8?B?WGZmTUFsdloweTZQcTNoRzlQeDNodGwxeHVCdHVPZTQvcFhOZloxVVVUcjhv?=
 =?utf-8?B?OUE3UjIvYUhpNEJBeEI3U2hickFJeFNNUVBWU0xyY3NFMnlReW4rUXFlZ0VP?=
 =?utf-8?B?YzA1dE5CWlZibTlhbTgxRjZ2RkUzeGVQTWJpVnpvRUpDck9SbTlhT0ozbFQr?=
 =?utf-8?B?cUpFRDQ0MlF3UHlta2JPMEtCSnoyLzhCUzNRY3V2Rzl6NXdYdjBIbmVRc0xB?=
 =?utf-8?B?NzYxRzJSQVk2VVhXSG1CTmJvT0p6NVNyalVPY3lWVjdwbmRzMnZWQ0I0Y2h6?=
 =?utf-8?B?SDBFWSt3TmxITUFzbUh2NTFxN1N4eWhEaVFyUWVRem13VjhpeExlWUYrVW9P?=
 =?utf-8?B?Ykg4emMwWmd2U1lIdmJSQW1UUnpkczFpMHhpN2cwVDV0dlYwelJDd1RIeGNV?=
 =?utf-8?B?T0V4Ym9GQkF6TXZGY2RQNXg4Y2xCTThSZjNUd0N1ZTQveklwZ29yWWtpais4?=
 =?utf-8?B?WnRxdGF2bitIaVptMUdNNnJZMllmVE1OZ2p5RGhqRzVWVFE5Vnlxc2tHNThl?=
 =?utf-8?B?Q1BKNVpUU3lTQ1NmUGIyRkx3WXNBZGlXQmdXVWl5RGhjaU1xQ3pOcjFJM2xM?=
 =?utf-8?B?dXJ2QXczc3R1SU1IMTJIK1FoTkwyWXIwY1pYcUVzR3JWV01tRHg2VW9KSWtl?=
 =?utf-8?B?V3d4L2Y3ZTQxVXRSOWtiVWxybjkwZ2tiMW1lSW8zNzRWcEdxRnZKVzRqWWJy?=
 =?utf-8?B?UmdMeFdFOVVKMXp1Q2h2Rm1GcDRkRTJaU3ZiRkl2ais3czlleXAyQXRkMS9M?=
 =?utf-8?B?ellQaWJ4TkMzeitwTE8zeDJIbDBCYTNXTk5YaXJveHI0ck0rU016TlNyamxG?=
 =?utf-8?B?V0hzVThKNWYvUVlDRDA3TzFkNG84U2tWbUYxOGFaZm1Mb0FtelBHa0s4MGNn?=
 =?utf-8?B?OWhBbkx6aFNJejVWdENnbTJyZXJwQ2laNmdXTW9DeVZlTnhMdHE0SkFuMlkx?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536f13ce-411b-4146-e0ec-08dd57d0755a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 08:18:19.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTz3+gKIvAr8c0LwJUPZb54w8UtasUoLFnRZGktPUysn7yF3FDMxw53cu5N1sNNrVuvlb14rAuFWLvIunA/bs0SQSB0UpFTztzI5heHrW7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7305

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP RTC hardware module present on
S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It is used as a time-based
wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during system reset.

Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
using userspace tools such as rtcwake:
# rtcwake -s 120 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V8:
- Added description of uncommon S32G RTC hardware behaviour on resume.

Changes in V7:
- Changed 'ioread32/iowrite32' calls to more common 'readl/writel'.
- Removed calculations performed in 'suspend' and 'resume' routines by
  using RTC API ('APIVAL') functionality instead of relying on setting
  'RTCVAL'.
- Simplified 'set_alarm' and 'read_time/read_alarm' by usage of
  RTC APIVAL functionality and relying on kernel system time.
- Added comment about the available RTC hardware frequency divisors in the
  RTC driver.
- Used both available frequency divisors to increase the RTC rollover
  time.
- Removed a redundant error check on 'priv->irq'.

Changes in V6:
- Fixed a coding style issue regarding kernel doc reported by kernel test robot
- Refactored small sections from the S32G RTC driver without impacting
  functionality
- Fixed an error probe path issue on S32G RTC driver.
- Added 'rtc' schema in S32G-RTC bindings

Changes in V5:
- Removed rollover support.
- Removed clock switching support between Runtime and Suspend. A clock source
  which is always available has been used instead.
- Enabled 512 value RTC hardware frequency divisor to achieve higher rollover
  time
- Removed unneeded 'remove' callback.
- Decreased driver print verbosity on error paths.
- Provided 'clock-names' actual names in bindings documentation
- Remove __maybe_unused notations. Used the DEFINE_SIMPLE_DEV_PM_OPS() and
  pm_sleep_ptr() macros to handle the .suspend/.resume callbacks.
- Fixed some alignment issues.

Changes in V4:
- Dropped 'assigned-*' clock management approach. Simplified RTC Runtime
  and Suspend/Standby clock configuration.
- Simplified error paths on probe function
- Removed node label from bindings example
- Several cosmetic coding style fixes

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of defining a
  specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the binding
  documentation.
- Refactored S32G RTC driver such that a default clock source and
  divisors configuration will be applied in case 'assigned-clocks' and
  'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings. Used clock parents support
  from CCF to better illustrate the RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings. Used assigned
  clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  72 ++++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 386 ++++++++++++++++++
 6 files changed, 473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


