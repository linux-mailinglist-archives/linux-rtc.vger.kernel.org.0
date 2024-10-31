Return-Path: <linux-rtc+bounces-2388-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79FC9B768E
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 09:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8761E281C3A
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070621552EE;
	Thu, 31 Oct 2024 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T88yZQsQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2049.outbound.protection.outlook.com [40.107.249.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32136D517;
	Thu, 31 Oct 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363767; cv=fail; b=BrLpu3iIgzlu6a8ajZggpv72wqXd8zIUTvuWILMQTRrFkijXxqz5+GCM6hSSL9gRyYvALwEqLvq9X00/mawOM1WsDoJAa1BXjCEXylCzKH7ldYh0wTVSpjVjYFOCF8DfzfNYFDih3amFfdU5gXsbSiak5EWJhJOAWUVlCuFDplI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363767; c=relaxed/simple;
	bh=KNjYou4MeWY5U2L/QEu2ao5yThID6TNxvu6bNiz7cD8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p6u8pc6qT2yTQmvNp/Lic96nn6Neyqf+sXCZvdWXobZyRSDPpL95C63rIyEt9znuMTm9iMaNpvEeY/FqklJYHbyRW7fZA6m8l1nHS2e4FarDTsyTPFdNt+YzwJyA3VpPCBqcc8P5WU+2eJib5nFExvxbS38k4PD0Ntz+jlpCtJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T88yZQsQ; arc=fail smtp.client-ip=40.107.249.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8W4n7TKZ5IwTjotZpnmCyzWPWYwqcSzzt0M40570jthjHUL9Yi+rlywlipCI8likNlrXfIJwSLlP3F1CjNfOZcb1nDPCH65zl+SJc0kPncOzO/pA9ab/cr+39ROTtchC+GSTJNdU4zTHbxeTYZcwXXz9rdahdsNgH6oLGRJnCZbajtJbeXF3jjjzTpn6HM9XhIINWVl+PNyShiFsjlPnP16AknMPGnO0PSGL8tECPPhGOrqCTGGM8n6drfcLxZ6a3ecGppFE5Avg6of6bcdwAhzi+/1qFgXJ+FBz7lJUcHzkdhDRzVHA/WBWsdRjOveMGq631xTwi4g9TfnbSbGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UpZIh1gPSxHArsqgu9rqmEHI0j2L8Brcr5WHrGno/k=;
 b=d/e/v/qt0zy8rQUVV9ZtOwcZT2sNkycttLdQV1TCQYeXvOB4nuJCB/+7W/8JYeU4LjeBDlxie9maAO3LeYrom+mYvjC8erMUBiADP40kDk9SNayd67Hz3JqkSHQbmZLYQ942Cun6j0o2YqOr2EVf5/1JIe/ZHRLS9lo7sGXcbFMYLCJ/KsT9TtQjYposSDUaBhexTku23eYel9fNfUh6upM6E8DS5zPPLUdaDrfDAmQsxM7HF6EJ0b+bBGHi7z25sqCIxAsBUjFYTvOE+PodolKn8u8WzC/XS0KeHoYCe7HR7eq1V41q0OJz7lH8YZLKMarnQ2aDOFwNibwRgInyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UpZIh1gPSxHArsqgu9rqmEHI0j2L8Brcr5WHrGno/k=;
 b=T88yZQsQ1WMWuHE7dmqwx0AoPqI7DXNFwTQ2mSM/f47V1faQozhGjxH9R1co2scK0TJ1d7wXL2MWfJ3OY9XfxetlEtVjJE3u3YJ4ev85cvU/j+v/JEts6ImFEYI4vwx4+ser/Byvp5rUSkZO9K8FH0xTI1HHyrqgc/qn8B7nC/N02Cjl7BrpBh1utOkH6s/S87Xn1KjXeELT39zFXVUzmP5rYCo2f+oLM+t2wXI+OY+1vteaogJlFAlkSPRL5r3ZgJb8uLJSM0Ak01ekBhtCvwlwGzX7ttfJk82KUdhFsEKOhahJsMlFEAABuJq345od21I+LXG+7SmCINTQp0cYtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI1PR04MB7199.eurprd04.prod.outlook.com (2603:10a6:800:11d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:36:01 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 08:36:00 +0000
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
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Thu, 31 Oct 2024 10:35:53 +0200
Message-ID: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:208:55::36) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI1PR04MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a902aa9-8310-455e-6dd7-08dcf9870c9a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlk4VVpuVy85NUdsVFZ3dXdzZU5XWUk5Vkp6M0x0M09odHFRN0VLM0QwdEJ0?=
 =?utf-8?B?VGpnWktGa2svODFlNFZiaW1QVloyZEtFVVF2Y3hwdjBnSy9pdFNQQlZ5L213?=
 =?utf-8?B?b3dDRFRBclp5S01aRHJHWGRCWEcvdVFKZ3ZHdXVyanRYSnpsSnlVcnp6bXYz?=
 =?utf-8?B?UDVlS0xscXRyMjUrcC9PZ1NZT1ZDSXdHVTBUTnFMY24yWTJRaThkbDlNM2t2?=
 =?utf-8?B?UHJIek45enlnalNkTHdlN2xxREtjMFlKQ2ZmcVltMU5vNXFOY1ZYYURxODV4?=
 =?utf-8?B?VCszZHNXNDZZYTU0bFhUeGxvcW9kcFN0eHVONTdjRnYyc2pEQXBIV1YralRP?=
 =?utf-8?B?NmhHdGdYSDVPbUZXd2c0NFU4TmV4bVVITzFrTGhnbjBXN0d0bFppUlZjcHR0?=
 =?utf-8?B?ZFNMZmhYejhuSlNKRUUzNDdXUlNBMnRPWmFFcnN4M28rOEZ1YlBRK2tydnBs?=
 =?utf-8?B?dE9xYTBUcnVQQ2Z5TzBZOS9jOE1tQzFTL3pYRWRtZ0N5UzkrS1pYMmg3bzhi?=
 =?utf-8?B?R3JEQ0NmM0FGWnlFd2dNUVY5dVgyUEU2U1hKT05HKzg2eHdOeTgrcEN1Undl?=
 =?utf-8?B?RXJBUFNXQTc0eEk2WU5ENWtxTzE5WllRNVRQdEphcmVTMVBnQTBDaXZVUWFi?=
 =?utf-8?B?QW5Fa1h1TkVyRURheVFidzB4NjVrOFRDZmpMZVlKaE9oYUhIYTRQYi9IdWJN?=
 =?utf-8?B?aDFvcDZBL0hhVlM3c3VMVks2UWYrZk9MbjYwVkFNeSs3dEpNUVZqcTErcGhn?=
 =?utf-8?B?dW4vRWhlNGN2WitVcEZFdFVZYXBLSm84SSszRlJPc0JFVUpHdm5uMkRvMGpu?=
 =?utf-8?B?Z29BeW9lN0tpdVlpeGJUYm9ucTZ0dlFZbllTRHJzTzlyTDBuZ0hlV2FWMzVp?=
 =?utf-8?B?Vmw5S0R4R3A3WCtOeWpDMk5TaC8vN05qVlFhV3FhcGlDVE9GL3BVbTVvdlhJ?=
 =?utf-8?B?V1NtK282eG40Nlc3bXFxck1YYWZPMDZlTTE5UlNmLzZiZmlzZkpxeWJmMUVa?=
 =?utf-8?B?LzlETnRYTEU2ZG1zK2QwcFZtNFZaYndXMHpNOFhVbStucEJkUEM1czZiWStL?=
 =?utf-8?B?dVE0Zy9Tck1tZzRpMkhBaDk1WE9RNll3QXRKcnlyQW9aOEdxWUxZUFNraDhl?=
 =?utf-8?B?U1BWaXJyZG1sc0ZSZzVaSTZSb043SnN2UE8xbzB3TWt5bzd3WWtpOVVCQk1h?=
 =?utf-8?B?RjB2ZisrRWRJdkt1aTFDVDI2dHB4RTZ1Z2l2YWhUQmhJaXYweFcwbWFEMXJv?=
 =?utf-8?B?ZEUvcHFLOXBjN3lkUmpkazlXcmNOTHlWbkhHblhHR0habnZOV0F4TmpFZTNx?=
 =?utf-8?B?dUVOanV6L0RRakJHS2lNSzUyTE00S3EycytSZGRiUEpaZk80QWRQK3VPOWJM?=
 =?utf-8?B?c1FlUjUzT0xlUjY1eWI3bmlEV1VyMGQ5R3JzNy9RL0NBZ3FUQlc5WmxlaVZz?=
 =?utf-8?B?akFoTDI5NnAxVUQ3T2J0T3VaVFNjekUyQXQwWUpwUHhDM1pQSk9sL3lWYkcv?=
 =?utf-8?B?Qk8zQXdkbTREQzAxOVdrMnJSdktwbjdrRmlvTkxwU1Jqb1I2dzkxS00vVmhP?=
 =?utf-8?B?UDB5VE1vL0xCU29rTzRNZW54MXlzcjZTcnFpOHQxWFFYbHdCemlJdTF6Nll0?=
 =?utf-8?B?N0gwMmMzQzR1ZCtxZEhJMFdMaFZyb2MraVNvODdCQTIrMkNJQTB0NG1XNlRO?=
 =?utf-8?B?eXBoQzVWcysrUzRvcklGT1I2K0lrNmdXcURydnF5b3ZkaGtvSGZadWJuTTMv?=
 =?utf-8?Q?tlM+p2hj3zLI94SPqccxNmqVZNHePTfiUwvsYGK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0JpdFdnTFpxQ0N4N0pETUJyK1FYMURvYTBnWThjbmpMWUJ3aWtBdVJrSUpw?=
 =?utf-8?B?ZDczalV2Z1ppN3JEd1V1c1lHbmNIbFR2T0djNHZRb3o1eGo1TkxLdXByc2k2?=
 =?utf-8?B?NmxPN0pYeVN3T3pRbDFjV2J4NDBuK1BvUldwcVNtVmFiK3NMVk5YTURpV21B?=
 =?utf-8?B?akVrSnVVamdUNFlCYXBWUzU1cWd5M2k4YWhpdlYzdzJqS3lkNUVJcUtPSU9L?=
 =?utf-8?B?Mi9GUmdCSzlSa3dIbWZYeUxNSVI0UnlCQlNtVmlBT25BOEcrYWkvM1NJQjFP?=
 =?utf-8?B?T3ZFaXA5a01FK29uZ3N2S0pBMTlYMzBzV2dId285aEZmYjhTaWFQMkh6TTVT?=
 =?utf-8?B?Qng2L3NTZmNMNUt1NnphZHVEaEViclN6L0MrblI2UmpJdzV4Z0phMlp3TCsv?=
 =?utf-8?B?ZmRMYlVHOENmdW0wM0FlSEFBYUFHd3ZEWnZJV3BqYTRsNFAwRmY4dzd0ZllH?=
 =?utf-8?B?bVB4TGpYTXpDSTJXMVp4N1dmWnQwdFJScElJRVVWMDNPTDJjTlhSQTVZalZn?=
 =?utf-8?B?V3pvamNvSUM0dDVHQVZtUDBHQnRNYlBsNUlhNTJJYVh1MFpyWjlaK0ZRRC90?=
 =?utf-8?B?NHlBYm5Sb1lGdGFpZGpabC82ei8vZnpMOXRMWHdObm45ekhxSk5WSmtySGNN?=
 =?utf-8?B?TFoyTjJmSU1uY1FrVittaVFqVXBDVllRT0VXN1BLREc5aTVCYWxHcXBUTEFz?=
 =?utf-8?B?N25zY2hxREUxVnFMMkl2TVBqNzhPSlFycEcvbkNZM3pCcDlCNFdEUG1RNGQx?=
 =?utf-8?B?dEFrSHZSMFpGMEFidkZkaDhLRVRGbzNTMDNrVTUwdDdieTA0U05SYUVjVGRr?=
 =?utf-8?B?cEhIckhNQm52ZGo5MzhPdzFPRWJkWUpIdUthUDlGYnVDcERhb0pydmpvc2ZP?=
 =?utf-8?B?Y3JYcnhMMTNyMGhTQ0tLWlo0RCtnRjgrVXZLRGY0aE1rMFJJcEcyOXdOUC9o?=
 =?utf-8?B?ZzFKd21GN3VqT2FyQzNWNFprTldoS20zY0hJRThjUlB5dldKNDlKNU16cUNE?=
 =?utf-8?B?enlKTlp1aTNqdTNjMzBYVG5ON1RMeFhmWVBLcEozMS80eUdtUVl0VWJOYmVl?=
 =?utf-8?B?RGNEL0UvSVE2OVQ1S3ZSek1YT1BXem1iSER5VmZ3U2k0S2p6bkROVytLQVBn?=
 =?utf-8?B?R3oweERxL0dHdjVEYmJ6Nno2dzVnRERqM01Kb0pKNEkxcTdoU1hKdkVyWFk1?=
 =?utf-8?B?ZWc5R2dxUGxBbWFxUndQaHJza1NmN09IUC9JSDdEb2VuWEJJek1CVVU0UUxH?=
 =?utf-8?B?bUxOckI4cE1hVnRyYzdIbnh6V0VvME1MaUVDTWRIVThCRXBYbWNycG9RNUxE?=
 =?utf-8?B?Z09Pc1BWbmNLbEFnMmZrM1dtTWlpSjJMTnpLQ1BBVE5BR1pnVDR3Y3N5ZjN0?=
 =?utf-8?B?ZHM5dWc0NDN1Rk9hOFoyYS9RRzk0ajY4NnliOHVDTjdSYnFWbWNxdHlKWFRI?=
 =?utf-8?B?MGVpd0NJWDVaRTBDTzgyRXI3OFNHUDBXT2JlOEw3VTQ5bVR3Yk8yZ2s4VkZO?=
 =?utf-8?B?bzZHTzVjZzg3MnBpY2ZIdXE3VFV1OXdHZkxBeXp5OXVOQVlpYWpVSGFOT2ZN?=
 =?utf-8?B?VFJzaXlETDlPdzJOZ0JtQ3dKeTBPZVYvVDJQL0FwMTUvZ0s5UUxLV0dqN2pP?=
 =?utf-8?B?Wk1PM3NHdzZkUnpyYWRCYzQ0OVQra093YXl3RDJBMUZzdXNOSGhhNXROdWhJ?=
 =?utf-8?B?K2paakJOSVpiODR0THdCbDVveTdOb3ludDBtUDhRUjB3aVlQSE5aTDk1T1lS?=
 =?utf-8?B?QlovTW40WG02L2FNbkhSUktpa2NmMGhzak1xamhiMkpFZ3dVSURqbXZ3TjBM?=
 =?utf-8?B?dmNRZGx1OXovQk1NWGk0clpxYjNuZlNqS1JGVytYQ1lneThaVXI0VThVa2Fj?=
 =?utf-8?B?Zll3ZTREaW10UUwrS3VpcEZBcUU2K3M1WXB1OVU2VTRHa3lNOE0zYUtZdk1h?=
 =?utf-8?B?ZjZRdi9iKzdQMUYzOW1WbkpCRW14VDJMaHNBOWE5WkIvMDVuWms4QmhiSEIx?=
 =?utf-8?B?VTRiUmZ3Ym9hY3BURFlDS1p0aUtRWi9qbHJMNElHV0NNNDcvS25xYlBTcXB6?=
 =?utf-8?B?Z3liK0g2TzZyQ2orc3ZhaHdwaCtGb29ldXZ4bDNQZWhXellwTjA5MTJIcUJ6?=
 =?utf-8?B?b1BGQmoxUnd1TXU0KzlhTmF0TWRxazlwOXhaMGRlQ0dDUGZWYURodGd0WGJl?=
 =?utf-8?B?Qnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a902aa9-8310-455e-6dd7-08dcf9870c9a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:36:00.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjpA9O6RLnlAdXVivZ6Q6RVHEnBck8dNqkz6szjcV5UxztZxkkt5Bzrs7U0KhsaKFj24uDuIj4C+mMUFrcKMK4nG5aBQPIleCS0GikS0rak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7199

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP
RTC hardware module present on S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support.
RTC tracks clock time during system suspend. It represents a
time-based wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during
system reset.

Following is an example of Suspend to RAM trigger on
S32G2/S32G3 SoCs, using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of
  defining a specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the
  binding documentation.
- Refactored S32G RTC driver such that a default clock source
  and divisors configuration will be applied in case 'assigned-clocks'
  and 'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings.
  Used clock parents support from CCF to better illustrate the
  RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings.
  Used assigned clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported
  by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  99 +++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 803 ++++++++++++++++++
 6 files changed, 917 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


