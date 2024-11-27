Return-Path: <linux-rtc+bounces-2635-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586CC9DA79D
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 13:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2425B298C0
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Nov 2024 12:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56DC1FA279;
	Wed, 27 Nov 2024 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j8Qb3E4W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1947E1FA262;
	Wed, 27 Nov 2024 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732708912; cv=fail; b=HHfs3rvvW/Sii8zrDJx4NYeNorfM4+uOaFs5n/ijRuZ+EH4sEkC6G9RVVdTxfI9dqLpmpMBkmo6v3nZtsVsaBQDWAB1heP3NTD+E8YcvJVOktPSH02l70CmX4Je4z1AbHd1/RvfkCrXIgxod4l5jBj9qtma77D6O8IYX6iOLZQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732708912; c=relaxed/simple;
	bh=PL7N25CQEsCtHt5EtS+8PWjmJL6dPAsOcFGvdEBLc/E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GUiRueaoM/0QLSFREJXPKK7TgGN4+zOng93/ijrLX66c0fXbjzWBNO7IAs7vfM35Aw7A/TrBjd+xeJ4lMh/N2+x81GHDA4XbTYttMmAJ4aCo6Bc92N2N83n/w7658Y5zxku84TsvWEiIJJhp3mFbyfuYjWOz6SK513kbSX98zo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j8Qb3E4W; arc=fail smtp.client-ip=40.107.20.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFF04/3KUQjUY04Ot6oeo+hKXWIeplZQxlm8r7NX8DzOnv/KmBP54fJGYY73XWiZsZpdxWf7dZcDxNl13hl4ZZadvgDC1dDAPGzbl7GDjobi5ax83mzMF7IpsQ4lmu1xxAhMeV2UKIW/7WDyeqHECXqFjVeXpSqonoPEwUDLMs1kiot7hJpyfXS1t13CX0K8bpA30TjoteaPCP0ADkfM1rtAMk5RqNxs952qAAFf8pbHmkERzEmIay2ew9NY4ZuU+fyeaexD3KoDxK0S2+Zyo+DvWCKkseHnl/8zoNnr5Hb7qkfpvpYI+5rYuJWaM//tw7rBrnEkzNOqut/mDJ7TWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofc7E9xbxB+HL3oucpJz74FXoYulQl+sLVvvgMN1Deg=;
 b=k+4uEqbo89MejLxAFawCqzze+diOIlLmmfADWDgzoN8mZRYA2lCBXxcUeZFoTYC4auRm+n70BtM0OWqCCLa1G99J0uiDUypEJ4RJKJYfa3qGP4QVVfrX/jXjXeCSCJLZdPOZXXk3nKJHcxgAUuXuPfQbcKeWKo+U9DxuycCUcYwuJKegAYLAPPTuw0iDAS9ws0aJV/JUnr+webDeK/RCx/KiP7Ker4veE36o268Jcmng90aJDs5pXT6ur+z+YbEVuMCM2me/R4o9K0hB321bBnFP0X1UN4He+GlrZASG48Tvkxi8czd9x5LfFkK0sUH0gUn2K76RfIzq43GiPBbt6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofc7E9xbxB+HL3oucpJz74FXoYulQl+sLVvvgMN1Deg=;
 b=j8Qb3E4WT2xwaIL5ZdCw2eG1BAT0vETgLDsmdGfCamrKnF72VC0BQLxPxJgLlcvTChaG6T1wcvRzN7Tmwxek0C7UDH7SJ4YvWtYuyTlzk0ldHFyPp4/vbNy3qggLZL/H2CwIUj1g9mHMKE0ynL8yl+rpCIcqAKfdNxDQuhXrtvx6xschz2ruAsJQlj70hUlE7POVv1M2/qMzCtRtOZ6ikjuPZqGC8pL6G2cYPhY0Q2tMlHIXCGh+lejohmx2Lpzep445RNgd+97SYpig9I4KQe7k+Hym9aFm5VNAARa1EGJjQLsDTrif/4IEL62j7ybE5Erk2ETzDklvO3bAKvKuag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB11079.eurprd04.prod.outlook.com (2603:10a6:10:589::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 12:01:46 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 12:01:46 +0000
Message-ID: <a089bbb7-a378-47a7-bb83-a38c8d2f47e2@oss.nxp.com>
Date: Wed, 27 Nov 2024 14:01:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-2-ciprianmarian.costea@oss.nxp.com>
 <0c4f7e62-bf9e-4e4f-8493-db1e56773f38@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <0c4f7e62-bf9e-4e4f-8493-db1e56773f38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::12) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU4PR04MB11079:EE_
X-MS-Office365-Filtering-Correlation-Id: 8111747f-5f2e-470d-9653-08dd0edb4422
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2UzZFh6UTU3ZCtaYm9Ecml5Zm91TzBycmtoellDUnlxMmcwNi9QM01MOVov?=
 =?utf-8?B?NG52SU9aZGpUMHBlOG8zeUVCbi9lOVpwZGhONlBmMU1jaGIrR1hBTld3Ni8x?=
 =?utf-8?B?Q2YrOGhKMExqMWFDeGZmVENYU1RRcHFlQzBmdDZobUdHN1ZmSDJkS0pzYXhL?=
 =?utf-8?B?NUVsQ2IxMlY3OXFuZ3B6QWdYNHRmcWtxQ2o5dG1GN1Z6VHFJUVpQTzlJalhQ?=
 =?utf-8?B?ekpLUXRkaTZ1MlAzUnBmNmVKQlRDTDlaSHk5QkRSVzE2cWs2M3dud2RPZjlJ?=
 =?utf-8?B?ZjJpMmVjUmgwTlRqcW52cGNwTzcxNXJyN1FOMGZYZUxGUVYxa3d5WStUTG5n?=
 =?utf-8?B?SEJrbDVVSktVMlhHNmV5Mm9LQWswKytVM1NYUE15WUU1b2d1Sy8wYnRCMzhS?=
 =?utf-8?B?Y3gvck1DMkVLTHVzaXVVRmxSM1ZEVzNmTHhOQm03dC9kcHBRcDNCUCt6SnZZ?=
 =?utf-8?B?OUp5MHhkekVGZTZaMkNRU0VUUUV4cy8rK0QwaDdNSUpuWE85K3hNbnN2T0RX?=
 =?utf-8?B?U29HdDFhajNFYlVBUmUxWjBUVVJyRitDcHN6VG54YTQ1VENoOVh4K3FGTFJE?=
 =?utf-8?B?Y3R6M1hZek9ZekRCVCtjTmM2Ui96Y1lnM3FLR2RuTlJqMGEyYktJMUYwMHRV?=
 =?utf-8?B?NzdaNDFrMUhKREdHVXY2anlNTHlhT1QwWmhlblNYYWZWVmYzRDVzTUhqd0NP?=
 =?utf-8?B?TzMrQmljWWlVeFRhdFZUODFXVmQwWGJXTmVsNERhd1hqbnd1bXYxUWF6RVFU?=
 =?utf-8?B?cFFaaEhGVk41REF5aW1yb0FiTUdwU1ZQREJidHZ2OUpLbWJVWW5zU2E4dmN1?=
 =?utf-8?B?M0xCeDcyNDVzakRhK3VzZ0J5UHFNbFdBNFZFblZRMFpvRG1BZ005b20rbG9h?=
 =?utf-8?B?M2RpaStFS2c0U3RoNU44M1lockUyaGJ4M241cHA3eTBTYnJzbm1BR01hVEZC?=
 =?utf-8?B?TXJueUlZL2dONG9SSTZ2dUgrVmhuOHdpUnh6YXp4TjFGVUl0QkdKdk1zd2JJ?=
 =?utf-8?B?Wkg4Sk8yV1FKcXlxRWlkNEtzbHdSUnE2WE4yZ2hrcXdPTDdaY05SVFRBQm5x?=
 =?utf-8?B?T05oQjAxUmczN1gvTVdBYUEzd1VuNUM1bzVHN3g1dGxIeFQyUDdYMHJxQ2Jz?=
 =?utf-8?B?RDBiUG02YURTTmxlNll4TXhoNjlJdWYwV3Ewa1AyTjdhbXZQUGlBaW50dW1a?=
 =?utf-8?B?aSs0cHh6M0oyNUpHKzd3bXBVZDExUGRmVGhXczc3Q2FDRkVXaW9KYnlHNFpq?=
 =?utf-8?B?L042d1RpRDRNRjh2aHNNek1DMUFxSXlQajhQVFJBTEVlRTF4WThZMDkrZlRv?=
 =?utf-8?B?eVkyazZ6N2hGN2F1NzZoVjZoR2RBcmcwby9xYTNhWGN1S0NHQ3p0NU90eEJT?=
 =?utf-8?B?Q0pzZEVUMG5ieVl0YmlpUlF1dzIzcFJRS3BBZituN0Y2NTFlM0VPYll5VjF2?=
 =?utf-8?B?RDl0T0lCQ1VPNDNFOFpJYU1BQmtBbFV4VE1BN1hBdmhOUUdiTHVhKzVuck1L?=
 =?utf-8?B?WDRQcldKSFBmRlNXNjBKOWtXdDNBbU50OFZzVkJmWDhyUzlQNFkxcFFVOUFv?=
 =?utf-8?B?YkpwTkY2ajRrWndkYUFyeVFHTHVCbitUSE9EbHc0YkJlYlFLQUNjSUJSZ3Fo?=
 =?utf-8?B?cXQ4cFR1ZjhxN1E0RkFCUVYwcndmMUNLWVFnblB3cVhqTFFUcTZ2Q3FrVHAz?=
 =?utf-8?B?Q0VyMlQyanJqTHZpTk1Ob0Z2N1pJRWYxYVRYbjYzcmF4cGl5WmZmR0dlaE9o?=
 =?utf-8?B?WU5Ua0VybWpCVDhHWDdBbDBkMmVPUmYxTGhsOWFORk9NSFpDVHZid1lISkNH?=
 =?utf-8?B?bHNXV3N4S2ZNN056aSsyZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHZkdmp2OHQrWUs0RHEvZG9OKzhIMmhGSTQrcmtMVjRDMVR0OXlDS01ja3pC?=
 =?utf-8?B?TTlPVTNEbWE5cGJlaXhqeVFUVzhHUDRWcS9FYVh1L1NFMHVxbGF1MjV0aGhK?=
 =?utf-8?B?NGRiS3I1T3gxNDdCTjlmSitFU08xaHkyNzMrR1JjMkw0eS9PMGRtWEdsbjRH?=
 =?utf-8?B?Znk2TFB2ckhKV1RlNktlTTlCU1hSeTJkRWtid05hVlpRckpnNmNMUzZqMHFr?=
 =?utf-8?B?WEFIdUZ2anE0enNTdEZQNFVjNFFBcW9IcW94Sk9Sd2RvRm9mSThhclFQZnBo?=
 =?utf-8?B?clVYQ3I0VHBMVmtpeWJNaHoySHN2aHFZOEdFRzhQTmhqZUVOV2NuaXV4OWpN?=
 =?utf-8?B?NGtJajhuL3Mxd3NhSE9icy9WeDFMQnJmY1NGd1ZSUXdWdjJlanpRTTVibDN6?=
 =?utf-8?B?Ull6NVpnUVFWa3gxa3QvRjc2bnZzbU0vOE5vWHBCd1RScmVPVE1RRHRuUG1m?=
 =?utf-8?B?bFRHS1lmbXpaamdWKzR4L2NIcnAwdndmL1ZOOHFSdVNhYkxlTnZ3L0tGa3kr?=
 =?utf-8?B?QXFuTlVaK0FURUhzWkVlS2RzblNyem9iYlh5cXRabk16TVhkQlRmQ2JuNXlL?=
 =?utf-8?B?NllRUGxtYTV4NGNLTy9TK05Vc1JLZUEwVkRGUWwraXBKU3V6bkM0SUcvaFRv?=
 =?utf-8?B?dkw4TXhNWlR0NEQ3SW91NUxXdzIyaEdoM00rL3pnbkZRVUxmVXVHR1d5S3Jk?=
 =?utf-8?B?VHBsY0NQZHZOK2RFV0UwYWtCWlBoT2dpalVycUxvMkxEOTZHSjNEVTNlajN2?=
 =?utf-8?B?SG5RNktLUEc2cVF6YmJGNVNPb1FOdkx6aks1ak1GTTBJLzA0dDdHdlBFVVYw?=
 =?utf-8?B?SlZsdjdhUmJjczVUcnlFSGx1VkNmaFFuOXJWbGdIQWx3Vk5zdWExY0Q3K0xw?=
 =?utf-8?B?QW5hR1FvQnZSTW55VEtSSkhYOXhpWDlnZWQyNkZkNnFKbS85Q3E2dzlqQml6?=
 =?utf-8?B?L3BncVZNT2pMRjF1dll4R1VnU1U4bjQrOHo2Y21MWS9taWJVcTlRbEl1MXRF?=
 =?utf-8?B?eXAweFpUT0p1NGNGTEEwY1NDSmZjVVkyYng2WVlhcWM4c0RDTCt1OUZXaDIv?=
 =?utf-8?B?ekhqTlVDKzZOYkR2SWhPUE5UdzFIbDR6YkpwcFpJeit1VEtNWGFxUExUQjBu?=
 =?utf-8?B?VWsxNDkvRkEyK3JaUkxrS2JUa2UraDkwaFVITTQxM056RVpScE44djkyYi9h?=
 =?utf-8?B?dVhyVjUzNThFYkNFNnh2eURTS3RtWUdFclJYQkhqQ0xnU1BnajRpVEd6SHdi?=
 =?utf-8?B?dTZSYzJ4VFlnK2gyRE9LQ0Evd3hTVGZiRFdVcVdqeGZ6NVdVRnpjQ1ZsQ2NV?=
 =?utf-8?B?VUZrbnFHQUJKWi9ZS3laMFJJOHIyVHJIa1d2Uml2dFRxZzRTZkxWM2dpNGUr?=
 =?utf-8?B?VDRBZHVmemVERXBUNk9HNmRrMmZ0Y0dTeVAxLzhVVVEwK3BRRUoxa0FtMVFv?=
 =?utf-8?B?cHVFVjd3a0dOWWQxMXdWMFdXL2VJcGxvREF3OHFmbnhHT1BxQ01vTlhvS3dp?=
 =?utf-8?B?SHNIZWxEMUdEdFdEbzZ3dUJ3VlBMNmloZXR6L3J4Zy95aVpWTmhqd2Q0RTln?=
 =?utf-8?B?VGR2V1VETFowelA0OHgrb2hKczNUS21yeXZaUkpwcCtUc20rMVY0bzZkVVJj?=
 =?utf-8?B?TFI1R3pjM2xGSTltdzhDMGZKTjZZWTVQL2hLSjRxemZvUmltdG92RlV2eWJK?=
 =?utf-8?B?WllJdlA1c0FMS21FSFIxL3Nwdk9SdEFIVjA3OFFoTzRKbTdXd3FaNDBLMG42?=
 =?utf-8?B?VEViRld2V3VDMUs0ekg5cmFMVk02Tmk3VXdVcUVrdHhDK3hDWE1XQU1hR093?=
 =?utf-8?B?b1IyMlZoSWdHNkV2NEExYU8vM2tmNi8zd2tTRlRNNXlGL1pyazFQV2JiU3py?=
 =?utf-8?B?NW00eFdlZFVQdjdmYUdaM3VnWDlRRVp6c2YzNGR5WlZwSTJBME1FdkY5UlBR?=
 =?utf-8?B?Q0sxSmlVM25JTDNNWGQvNXlCbzU5UTNUL3c5VDhjWGg5REJqY09xVXpabDYz?=
 =?utf-8?B?ZEtoZ0tmSzRrZEU1Mk50ZTZ0Z2w0QklMVEdFZUgxL2RUMFVwMksyRWlRSXVh?=
 =?utf-8?B?a1h1bnRHbk9od3QrclBVOVlmenVhRWtPR3JCUWhINkxHWTQxeUpTNFEvZDJz?=
 =?utf-8?B?MnJSNEVjb2dQRGpMN1A4SDdFeDh0SjhyM3NoZTVubXg3UTMzSXFjd0VNc3ha?=
 =?utf-8?Q?zC0pOzMunry7l5459CQHcLk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8111747f-5f2e-470d-9653-08dd0edb4422
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 12:01:46.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPPK/PD7cXKIqZ2SSRIT2YAIr1ZhbqRAv4e6lBTSPSn3dRqNq70RpPaq2sBs+1CXZUvPfKkqmaZ1yVcvg7KIMugEgFrwfCaxZ5xfr2JP7AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11079

On 11/26/2024 9:08 PM, Krzysztof Kozlowski wrote:
> On 26/11/2024 12:49, Ciprian Costea wrote:
>> +
>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>> +
>> +maintainers:
>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> +
>> +description:
>> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
>> +  It is not kept alive during system reset and it is not battery-powered.
> 
> Does this mean that this is not a standard RTC thus standard RTC schema
> does not apply?
> 

Hello Krzysztof,

I would say the standard RTC schema does apply but indeed you bring up a 
valid point in the fact that I forgot to reference 'rtc.yaml' schema.
I will fix this in V6, by adding:

allOf:
   - $ref: rtc.yaml#

>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - nxp,s32g2-rtc
>> +      - items:
>> +          - const: nxp,s32g3-rtc
>> +          - const: nxp,s32g2-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: ipg clock drives the access to the RTC iomapped registers
>> +      - description: Clock source for the RTC module. Can be selected between
>> +          4 different clock sources using an integrated hardware mux.
>> +          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
>> +          available during standby and runtime. 'source1' is reserved and cannot
> 
> I am not sure what are the benefits of allowing to choose a clock which
> cannot be used. I think source1 should be dropped.
> 

The current RTC support targets S32G2/S32G3 SoCs where 'source1' clock 
source cannot be used. The reasoning for allowing to choose it is that 
on future SoCs from S32 family the same RTC module may be integrated and 
'source1' may become available.

>> +          be used. 'source2' is the FIRC clock and it is only available during
>> +          runtime providing a better resolution (~48MHz). 'source3' is an external
>> +          RTC clock source which can be additionally added in hardware.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ipg
>> +      - enum: [ source0, source1, source2, source3 ]
>> +
> Best regards,
> Krzysztof

Best Regards,
Ciprian


