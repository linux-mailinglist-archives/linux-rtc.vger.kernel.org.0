Return-Path: <linux-rtc+bounces-2390-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F59B7694
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 09:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA532820BF
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36A9188CB5;
	Thu, 31 Oct 2024 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EhgaPzAu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2049.outbound.protection.outlook.com [40.107.249.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E018453F;
	Thu, 31 Oct 2024 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363776; cv=fail; b=WhcNF7+NFsOH3n10cBoBazIkOXQczt9ypB/NHv6TgkSFLRRMvinpR2rlDE75YTI//DKLt4NnRWkY8wfTbj4OcJgQN7wuldwnkYEsPm0G7m4BLNr2hc0O30bdNZrJGC3c9pHrxGU41ouXMZa3D8nTsb+jHTF4tgCFFn/YeLUtfgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363776; c=relaxed/simple;
	bh=rzuzLqgF1Wld1gG1tagIfccVz/W6+y7nWKkf7YrSu9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g8aneYotHlUdfJbr9hbMHJD/NuGMh4lGhMaPTIbMJoDNMmBcnXkhODKRvSuTeZVeAIM+SwvPXF2ZgWQGKo2mMKr+9rgIK5OlXm1lPiYeIHQtIMxEpVPQslGLN0duLYYjMyLVgY/nM7NUpaKO8YWu5ukyBZYSsxe4nhv4yCYGTsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EhgaPzAu; arc=fail smtp.client-ip=40.107.249.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spCCmr1/cSpv+R/dGoFVy43lpzWg0KNmgVOLo2Fg3K7hvptUvq6JU8Pit+fNqFeWP/vD9/jDfx7rVIg9SqvTnOfPVhcOBIPk1u8fJES434GGPwyOYrf3s4Iw+U50LYRWcnB9vIyaSlR2hywF3c5Ylhyk3NkQC/0CMgbvSUsOg3a75CNWfC5WdwOwypwMvllqGP3ol4xe5BttqwnYoP/1ZrVEOkJcI9/tOXTDQxScqYHiwGTqyO6Z/QxiNHtwLldTdcATwei35t5Xdr48I4V1q2xYzntJfqqTkzVI2lQpZ5Kaf5GKFUgDfEnJctLGbU9Fq/c2dtsLB5VriCM2KxF2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWaawxt77xC7mKWZ021v9pDtAqdlR6gtuXp4zwKk9E4=;
 b=TugtEVmpdViwi3L8okpTvOtrRz90Xo5/iLyL7ZPeIYf27Gpz+8mgbpJOt52SRA7pikLj8yC2iPjYhrT+uUgmRztHNhjpxnV5nLurqFrrIujt8tVCdyMBltlFtBMsYq2d6vV2pbQLuOg8kz1dAByr04eMrWdGbxOB24icAF40Jm2AWArkItnXD0CIJyIl7+ADxIOZyyKGobERQIhUNGXpQqX0cySaGNuDJ+VUNyUYgA+T0do5YgVRq2DpkIy/Ze2eX4FX4LPcnkccD9Ba4bh2f1UYBnYQFNu6HDlK9DiPZYwjfx8mt8SWozgZgRyucAZnfZE6Mma4t6RDK9mJlZt5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWaawxt77xC7mKWZ021v9pDtAqdlR6gtuXp4zwKk9E4=;
 b=EhgaPzAuOG8H1iiEzvDzFIE5ZswIbufkWBCCkdBAcVdOLKtARJZeMYy5HRXxPHmNvPhhtaIVntSv+Kh/tmxzyeEpMWj8Q48eAl+5/i+YXeqB6G2bpevWgJ1b9t+zirmIsT2YqJpmffN4sV91zWuz58L+PLPxE/ZIEA79dT2Xd3x/wPVEIhlon6lQwOXjmKJ35wePb6hjzhVaZygYNqzFRtN6Z1ucR0kTzh5O+3fkiwTRuREz8MCWJNh/yffKqM7cpEBdzFDIRBwcIEpPH2X/e0ubFwaTdbl6HLNNw9cFuGnzpUL6yMfK0kbWXy/FGgf6/zhE8UrHNOYWXugM8eqjag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI1PR04MB7199.eurprd04.prod.outlook.com (2603:10a6:800:11d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:36:04 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 08:36:04 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: [PATCH v3 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Thu, 31 Oct 2024 10:35:55 +0200
Message-ID: <20241031083557.2156751-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0143.eurprd04.prod.outlook.com
 (2603:10a6:208:55::48) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 7dd8dd6c-1c09-4344-c419-08dcf9870eed
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M05pZW1uM3UxVFFrUS9vam1MS2xKRS9tRTJFRUhSczczUUhQZlNqVHp3Vkln?=
 =?utf-8?B?NS9YVWRjTGxrU1ljN3IzVHhIKzVRWSs2NzNmMEMyYlpXLzAxaThxUWsyZXVl?=
 =?utf-8?B?TVU1RlpvemkwU05lcnRmcDdVUUVkOU15VzRlY3UrcUJwSkxSRlBBMzBXL3lD?=
 =?utf-8?B?cmJESXp4RUs2WkN0QXVyV3VCU1ZWVWdNYlNtUERjK05RTUZFMVBlOVc0bkly?=
 =?utf-8?B?b0FybUZuM2UwcU5tblNvL1hqOEJIYXZ1am9BaERJSlRMNXNITmhtaUpuckFT?=
 =?utf-8?B?Z0NWZXRRZTQ1T3c0a1lKRlZtcDZWUXlhKzhPbHBRZUdHWmkzVWhZK1ZseUxa?=
 =?utf-8?B?NjdWVGQvcjFHeHcwSXlxUGpiRTRIWC9KNFRtU2F1Um51SytSejB1MUVnMUJL?=
 =?utf-8?B?VVdLdXRYTVV4Sld0ek1mb1Z0S0h4bEtza04ycUlhbytVY2ZtQm9wLzJTTnp4?=
 =?utf-8?B?RmdDTTRyWmFwTWM5bnJQRCt1eWVrUjRZRlU3RGVhUHJnWnorTTVPTHMrT2M2?=
 =?utf-8?B?NTlJQ0VQYXdnZTRQS2MrNkcyeXhQNnRZSTdVZC9SekxQYU9WRTYweHlZTkF3?=
 =?utf-8?B?ZmhsMGRjRzFzTFVTNm5rMlhEdXZFaVl2N1Q3VUZDY3JvWkw3OGREaHhBNjQw?=
 =?utf-8?B?aEluWVJMODFMYnM0aGVmMDFxcG9Td0hmUlg5NGErQWp6MC9nbzMwaEhpb3ho?=
 =?utf-8?B?RVpFcUpuempvYThDemhZWUNEUXVSanBIR2NSMmZNTVZzQzg3RXl1ZmxYYUxh?=
 =?utf-8?B?SUwvRWpRQmJiQjEzNU5xb2JQN3JEdzgyQzBFWnFneEpqMmJUdlVwbWxZcEU0?=
 =?utf-8?B?eUEyNEVvVjFERHNSTUhYdHNRdWtLNkJ0OG5nTjNBT0xUR0lUTEltTEdEUHlo?=
 =?utf-8?B?QWZ5Wk9FU0gxakU4ZW16NGdzM1lPN3hPcnVpS2lvV0tjWTJZK3A2UmVDOC9r?=
 =?utf-8?B?VjBHQU5tWmUrWTIvL3REZDlIRjFyWDY0ZFA5S0N1MWZjSkZDYk5wa08yMUZI?=
 =?utf-8?B?WVcwWGdtNmFtTzQ5TThRNFl1VWtBMHFGQm82eU81MUFRbHNYVWVJY1RVTW1j?=
 =?utf-8?B?TWlTc3Z6bHdGSUpySy95L2pDaHdDTVczWHZwemdXKzJQSDNsQTRwaEZLZ0xR?=
 =?utf-8?B?aGdNWVJsTzl5czJzSkp3UDQva3g3OWlPNHZMbmlSVU9DMS9VWnlYdU85YWsx?=
 =?utf-8?B?SDM2L0JMN1IvUzNSSmFRL3NyWkJMWFcrWXlvcVRZU1pFa1hUN3I1VFg1aHJV?=
 =?utf-8?B?TkRCTDNhQk1sbVk3azV4M2N4TUk3UUUrRzR4RTdwSUlwTVg5TWNKN1F5YlRo?=
 =?utf-8?B?TzJFUURDT01QYVpNaXJ5RlhrejA1VWdMczdSWnZ0c0htdURiY0lpS1N3R2FS?=
 =?utf-8?B?WVlZUGV3WkpndFZoVTVMWEVjNEZCSWQyVjFTRnVlWGNWd3NTY24wMmdXODVZ?=
 =?utf-8?B?a01nR3BJWFQzcDl5YStJVlFVa1pPTjJ1NjZOcUJEY1RyL01Ja1VxVXlKaGRi?=
 =?utf-8?B?OUR0RGl2aWlHOTBCZEVnekhoUmxYeDRVdU5KWCtaRE84UzFmVkVUTlR0V05u?=
 =?utf-8?B?WUlKZUFubUxnMnQwR01CNzhMSUVtMkY1RlRhaWZ6UDVPdzMvM0p1R3JxWVpU?=
 =?utf-8?B?TlVkZ0lOdFR1cURjekR0U3BneXR6YUlTUVY2SVhXWjhwclRNM3RBREZubzEy?=
 =?utf-8?B?VnIxdTVha1BMazQ5OGpMSzlXL3owY243d3J2bWN4L2VHMzZQck1GN0puRkpN?=
 =?utf-8?Q?pEP3sKhjMTyCk4JVGY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmFvOTRDanlUVlhGQmlvWWQ4dlNibTBlM3pJbXJFK295RGxpbDFsWERzVXdG?=
 =?utf-8?B?THJjaFpYRWtCZXVsZDArVUVmalRiTHR3QTZSWDVLUFp5djBVYTZsMVkrNnFN?=
 =?utf-8?B?S3paMUUrR05rNEV1SEN2ZmpWbEZpRlJIY0Mrcys0T3lwdnBVL21CdFpXckZu?=
 =?utf-8?B?NFRLbnFFc1lpWkFSakhKN2J0cmRPZklrTS91N3dpOGNrMHN1NXN1TnhxODN6?=
 =?utf-8?B?ZkJlblYxTHV2TU1LQXBxdTJhcUdaSWYyLzAxRmhmVVpWRzAzdEpDZ29QbHN3?=
 =?utf-8?B?MDJpNE8rS3NEalMrOFZYVEY1MzBNNTNXNXpjQWN0bkNHdVh1N0pVekQ2Y1Rl?=
 =?utf-8?B?OFRuNTloMVFDNDRVdU80QlBscHluaU8vclhNQW5lc095YnlEaEJkblZrZU9M?=
 =?utf-8?B?MkxmZGUwWk5qdERaOFY2UTl0bzVzZXA4M1V1RTROT1RmYlBpbUtvK2tQVXZF?=
 =?utf-8?B?R0tIVThIcVBCVmY0UG1aenVKdkZiS0JZdHZXeTVxTEtQR282SXlmQk8wWWxr?=
 =?utf-8?B?eFdEN1lhNlEwcVg1cTJ4dU15bzBIUTBuK0dseWRjSHBhMW40VHR5UWRkaW5m?=
 =?utf-8?B?a1I0aFZoMXp4NUZWM3hnVmF6b042M2FYdUxHVkwvM3FuYUdHYnF2eURFelpl?=
 =?utf-8?B?WjdLdlIxL1YxdnhGZDV3c0YwbTNhTGd1UWIxNkczQUZhYUNnYTFqOHBTZVpu?=
 =?utf-8?B?QVg1WEFHQTFJNzlhK3FtTWNMYysvSzJyVHNmWTdzMVZsZ1hCMGRTSVhOeW42?=
 =?utf-8?B?cDhkVGFUK05jY3lQbmNpUCszNkVIKzhEV2g1dnRrdzc1WWtPVkx2eEsydGpp?=
 =?utf-8?B?M1BsYnJ6UUZZZ0JzMkxZQndqS01ZRC8vN3VRamMrNFdxbWNqdkdQaGxwSEw2?=
 =?utf-8?B?U1JkNlZ6MGJ6VCtXbCtYNHo3d2MxOWpBdUY2VGNLektFZnZuc0I4VmVBY0Jq?=
 =?utf-8?B?TUU4UVpHbWhIWVIxejY1SDhJdUIwcTVaVTQ4YXdPRGViQzc2Y3MvTW1QZWNF?=
 =?utf-8?B?ZXdaVXZ1S1dzOUNXQkY5d2drdHNFWTFkYUd6bG9GZU11Sy9jSEFLTVNPMjZH?=
 =?utf-8?B?N1A0YkFhSTFhNVdZZlBuR3pJdjRMd1Erc0FiWXBsVnduVUEvSGdlaDBDOUJQ?=
 =?utf-8?B?UEpxaHo4UVZ6OHIxVGlIUFYzYmRWb3JqVWpBTTM1SklZYWJwdmRyWnZVOXky?=
 =?utf-8?B?dkg3N0JIL29tY1RSMTBCODRKdE9GcEVMWHp5eWtjU0Z2d1hkaG5SNDBXWHdE?=
 =?utf-8?B?YXNMRUl2eDRHWDBzRkYramEvZ3l3L0JLOHJOVkFKZTg3ZGtrMGNKV3NLWndP?=
 =?utf-8?B?bHlDRUtIRi9BcW82NmEzbElSY08xUkMrK08yRTBjNk5MSk1rSU9LK2c4MWRl?=
 =?utf-8?B?TURWVjRCUERCMk8rTGJ6ZGFyWWZRWWU3T3N4Zkl2Y0k0ZWN2WSticUVqc0g1?=
 =?utf-8?B?UHdDZmZPRVFXSHNnQWhacGREdi93YjgwRCs2RWlCazNTcVRLSUNnYXlzODNu?=
 =?utf-8?B?dGlBWU8rTThCaVpkdFQxVGR1VVNlKzVJTW5mcy80eFlEY0lyalRRL3RaN3Iz?=
 =?utf-8?B?Mzl5NU94STRBYXBudFNKY2l0cUg2bGRYU0NnUkp0dFFBL28xQmkycjlqS1pq?=
 =?utf-8?B?Z2t0d09TV1ZhbnBjRStKdkowL09uQWI2eWIrdHlMNDE5aVozeXVZelR3WDNQ?=
 =?utf-8?B?YVR2T0tSVFdIblBqRWIvdVdkZUEyM3IzNXdxY1lJSXNMcmg0am13QmU4Qmoz?=
 =?utf-8?B?SVMxM3B1R0QwZm1tbDByV1ZPL2lKdjVFQ0REcm5qTmsraExNK1p2bG5kQWFG?=
 =?utf-8?B?U1hoanRRZ1FnWlFNY2xaVi9GZWwxMUJMbjcrOWpGWXdtb1NHdXVwMC9vbUxB?=
 =?utf-8?B?dTUrOHNsWUpOa0RiSHhXYm5kUGpxYi8vZVR1aFB6QWp0dUxEUklvYkFiWlUx?=
 =?utf-8?B?dW5IaTBZd3pTaVYyaWZVbGJQL3hWZjJDR0pnWnNEcG9FbTFsZ3JIcHBnK0Fm?=
 =?utf-8?B?eG1id1ZSOTZrS2xRWGh6M2RlVElFM1Rqdm9tTUc3aSt4NHg4Wk9QeUFpS1ho?=
 =?utf-8?B?YmIyaGZUTXJER20wZUNNRm1NZi9FRkhYYnBZbFBpVXNvS0d3bS9VZUEvUmRz?=
 =?utf-8?B?UHBmOEpzWHBodDJNeElRanZzenl4VFZrYitpUXJuZnJFWlBqSlRCTTUvQ2Zi?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd8dd6c-1c09-4344-c419-08dcf9870eed
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:36:04.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+JqzI+LqDyScBYMivivW9wxvwdWk3jvu2NtmHDCfHnjVrtHo3DDllBLr7KAq2W2DSimIYEaOSCSXKPRdni5HBf833tTJC+YHF2kqsyK0Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7199

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support
on NXP S32G2/S32G3 SoC based boards.
RTC tracks clock time during system suspend.

RTC from S32G2/S32G3 is not battery-powered and it is not
kept alive during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  11 +
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 803 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 815 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index e87c3d74565c..18fc3577f6cd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-ssd20xd".
 
+config RTC_DRV_S32G
+	tristate "RTC driver for S32G2/S32G3 SoCs"
+	depends on ARCH_S32 || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Say yes to enable RTC driver for platforms based on the
+	  S32G2/S32G3 SoC family.
+
+	  This RTC module can be used as a wakeup source.
+	  Please note that it is not battery-powered.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 8ee79cb18322..a63d010a753c 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
 obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
 obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
+obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
new file mode 100644
index 000000000000..a05e23ece72a
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,803 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of_irq.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define RTCCNT_OFFSET	0xCul
+#define APIVAL_OFFSET	0x10ul
+#define RTCVAL_OFFSET	0x14ul
+
+/* RTCC fields */
+#define RTCC_CNTEN				BIT(31)
+#define RTCC_RTCIE_SHIFT		30
+#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
+#define RTCC_ROVREN				BIT(28)
+#define RTCC_APIEN				BIT(15)
+#define RTCC_APIIE				BIT(14)
+#define RTCC_CLKSEL_OFFSET		12
+#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
+#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
+#define RTCC_DIV512EN			BIT(11)
+#define RTCC_DIV32EN			BIT(10)
+
+/* RTCS fields */
+#define RTCS_RTCF		BIT(29)
+#define RTCS_INV_RTC		BIT(18)
+#define RTCS_APIF		BIT(13)
+#define RTCS_ROVRF		BIT(10)
+
+#define ROLLOVER_VAL		GENMASK(31, 0)
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+#define RTC_CLK_MUX_SIZE	4
+
+/*
+ * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
+ * should not be used.
+ */
+#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
+
+#define to_rtcpriv(_hw)	container_of(_hw, struct rtc_priv, clk)
+
+enum {
+	RTC_CLK_SRC0 = 0,
+	RTC_CLK_SRC1,
+	RTC_CLK_SRC2,
+	RTC_CLK_SRC3
+};
+
+enum {
+	DIV1 = 1,
+	DIV32 = 32,
+	DIV512 = 512,
+	DIV512_32 = 16384
+};
+
+struct rtc_time_base {
+	s64 sec;
+	u64 cycles;
+	u64 rollovers;
+	struct rtc_time tm;
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	u8 __iomem *rtc_base;
+	struct clk_hw clk;
+	struct clk *ipg;
+	const struct rtc_soc_data *rtc_data;
+	struct rtc_time_base base;
+	u64 rtc_hz;
+	u64 rollovers;
+	int dt_irq_id;
+	int runtime_src_idx;
+	int suspend_src_idx;
+	u32 runtime_div;
+	u32 suspend_div;
+};
+
+struct rtc_soc_data {
+	int default_runtime_src_idx;
+	int default_suspend_src_idx;
+	u32 default_runtime_div;
+	u32 default_suspend_div;
+	u32 quirks;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.default_runtime_src_idx = RTC_CLK_SRC2,
+	.default_suspend_src_idx = RTC_CLK_MUX_SIZE + RTC_CLK_SRC0,
+	.default_runtime_div = DIV512,
+	.default_suspend_div = DIV512,
+	.quirks = RTC_QUIRK_SRC1_RESERVED,
+};
+
+static int is_src1_reserved(struct rtc_priv *priv)
+{
+	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
+}
+
+static u64 cycles_to_sec(u64 hz, u64 cycles)
+{
+	return div_u64(cycles, hz);
+}
+
+/*
+ * Convert a number of seconds to a value suitable for RTCVAL in our clock's
+ * current configuration.
+ * @rtcval: The value to go into RTCVAL[RTCVAL]
+ * Returns: 0 for success, -EINVAL if @seconds push the counter at least
+ *          twice the rollover interval
+ */
+static int sec_to_rtcval(const struct rtc_priv *priv,
+			 unsigned long seconds, u32 *rtcval)
+{
+	u32 rtccnt, delta_cnt;
+	u32 target_cnt = 0;
+
+	/* For now, support at most one rollover of the counter */
+	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
+		return -EINVAL;
+
+	/*
+	 * RTCCNT is read-only; we must return a value relative to the
+	 * current value of the counter (and hope we don't linger around
+	 * too much before we get to enable the interrupt)
+	 */
+	delta_cnt = seconds * priv->rtc_hz;
+	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+
+	if (~rtccnt < delta_cnt)
+		target_cnt = (delta_cnt - ~rtccnt);
+	else
+		target_cnt = rtccnt + delta_cnt;
+
+	/*
+	 * According to RTCVAL register description,
+	 * its minimum value should be 4.
+	 */
+	if (unlikely(target_cnt < 4))
+		target_cnt = 4;
+
+	*rtcval = target_cnt;
+
+	return 0;
+}
+
+static irqreturn_t rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = ioread32(priv->rtc_base + RTCS_OFFSET);
+	if (status & RTCS_ROVRF) {
+		if (priv->rollovers == ULONG_MAX)
+			priv->rollovers = 0;
+		else
+			priv->rollovers++;
+	}
+
+	if (status & RTCS_RTCF) {
+		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+		rtc_update_irq(priv->rdev, 1, RTC_AF);
+	}
+
+	if (status & RTCS_APIF)
+		rtc_update_irq(priv->rdev, 1, RTC_PF);
+
+	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
+
+	return IRQ_HANDLED;
+}
+
+static int get_time_left(struct device *dev, struct rtc_priv *priv,
+			 u32 *sec)
+{
+	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
+
+	if (rtcval < rtccnt) {
+		dev_err(dev, "RTC timer expired before entering suspend\n");
+		return -EIO;
+	}
+
+	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
+
+	return 0;
+}
+
+static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
+				     u32 offset)
+{
+	u64 cycles, base_cycles;
+	u32 counter;
+	s64 sec;
+
+	counter = ioread32(priv->rtc_base + offset);
+	cycles = priv->rollovers * ROLLOVER_VAL + counter;
+	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
+
+	if (cycles < base_cycles)
+		return -EINVAL;
+
+	cycles -= base_cycles;
+	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
+
+	return sec;
+}
+
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	s64 sec;
+
+	if (!tm)
+		return -EINVAL;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, sec_left;
+	s64 sec;
+
+	if (!alrm)
+		return -EINVAL;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, &alrm->time);
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
+
+	alrm->pending = 0;
+	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
+		alrm->pending = !!sec_left;
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	if (!priv->dt_irq_id)
+		return -EIO;
+
+	/*
+	 * RTCIE cannot be deasserted because it will also disable the
+	 * rollover interrupt.
+	 */
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= RTCC_RTCIE;
+
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	struct rtc_time time_crt;
+	long long t_crt, t_alrm;
+	u32 rtcval, rtcs;
+	int ret = 0;
+
+	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+
+	t_alrm = rtc_tm_to_time64(&alrm->time);
+
+	/*
+	 * Assuming the alarm is being set relative to the same time
+	 * returned by our s32g_rtc_read_time callback
+	 */
+	ret = s32g_rtc_read_time(dev, &time_crt);
+	if (ret)
+		return ret;
+
+	t_crt = rtc_tm_to_time64(&time_crt);
+	if (t_alrm <= t_crt) {
+		dev_warn(dev, "Alarm is set in the past\n");
+		return -EINVAL;
+	}
+
+	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
+	if (ret) {
+		/*
+		 * Rollover support enables RTC alarm
+		 * for a maximum timespan of ~3 months.
+		 */
+		dev_warn(dev, "Alarm is set too far in the future\n");
+		return ret;
+	}
+
+	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret) {
+		dev_err(dev, "Synchronization failed\n");
+		return ret;
+	}
+
+	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_time(struct device *dev,
+			     struct rtc_time *time)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (!time)
+		return -EINVAL;
+
+	priv->base.rollovers = priv->rollovers;
+	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	priv->base.sec = rtc_tm_to_time64(time);
+
+	return 0;
+}
+
+/*
+ * Disable the 32-bit free running counter.
+ * This allows Clock Source and Divisors selection
+ * to be performed without causing synchronization issues.
+ */
+static void s32g_rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void s32g_rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int get_div_config(unsigned long req_rate,
+			  unsigned long prate)
+{
+	if (req_rate == prate)
+		return DIV1;
+	else if (req_rate == prate / (DIV512 * DIV32))
+		return DIV512_32;
+	else if (req_rate == prate / DIV512)
+		return DIV512;
+	else if (req_rate == prate / DIV32)
+		return DIV32;
+
+	return 0;
+}
+
+static void adjust_dividers(struct rtc_priv *priv,
+			    u32 div_val, u32 *reg)
+{
+	switch (div_val) {
+	case DIV512_32:
+		*reg |= RTCC_DIV512EN;
+		*reg |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		*reg |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		*reg |= RTCC_DIV32EN;
+		break;
+	default:
+		return;
+	}
+
+	priv->rtc_hz /= div_val;
+}
+
+static unsigned long get_prate_by_index(struct clk_hw *hw,
+					u8 index)
+{
+	struct clk_hw *parent;
+
+	parent = clk_hw_get_parent_by_index(hw, index);
+	if (!parent)
+		return -EINVAL;
+
+	return clk_hw_get_rate(parent);
+}
+
+static int rtc_clk_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+	struct device *dev = priv->rdev->dev.parent;
+	int i, num_parents = clk_hw_get_num_parents(hw);
+	u32 config;
+
+	for (i = 0; i < num_parents; i++) {
+		config = get_div_config(req->rate, get_prate_by_index(hw, i));
+		if (config) {
+			if (i < RTC_CLK_MUX_SIZE)
+				/* Runtime clk source divisors */
+				priv->runtime_div = config;
+			else
+				/* Suspend clk source divisors */
+				priv->suspend_div = config;
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "Failed to determine RTC clock rate\n");
+	return -EINVAL;
+}
+
+static u8 rtc_clk_get_parent(struct clk_hw *hw)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+
+	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
+		RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
+}
+
+static int rtc_clk_src_switch(struct clk_hw *hw, u8 src)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+	struct device *dev = priv->rdev->dev.parent;
+	u32 rtcc = 0;
+
+	switch (src % RTC_CLK_MUX_SIZE) {
+	case RTC_CLK_SRC0:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
+		break;
+	case RTC_CLK_SRC1:
+		if (is_src1_reserved(priv))
+			return -EOPNOTSUPP;
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
+		break;
+	case RTC_CLK_SRC2:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
+		break;
+	case RTC_CLK_SRC3:
+		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
+		break;
+	default:
+		dev_err(dev, "Invalid clock mux parent: %d\n", src);
+		return -EINVAL;
+	}
+
+	priv->rtc_hz = get_prate_by_index(hw, src);
+	if (!priv->rtc_hz) {
+		dev_err(dev, "Failed to get RTC frequency\n");
+		return -EINVAL;
+	}
+
+	if (src < RTC_CLK_MUX_SIZE)
+		adjust_dividers(priv, priv->runtime_div, &rtcc);
+	else
+		adjust_dividers(priv, priv->suspend_div, &rtcc);
+
+	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	s32g_rtc_disable(priv);
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+	s32g_rtc_enable(priv);
+
+	return 0;
+}
+
+static int rtc_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct rtc_priv *priv = to_rtcpriv(hw);
+
+	/*
+	 * 0-3 IDs are Runtime clk sources
+	 * 4-7 IDs are Suspend clk sources
+	 */
+	if (index < RTC_CLK_MUX_SIZE) {
+		/* Runtime clk source */
+		priv->runtime_src_idx = index;
+		return 0;
+	} else if (index < RTC_CLK_MUX_SIZE * 2) {
+		/* Suspend clk source */
+		priv->suspend_src_idx = index;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.set_time = s32g_rtc_set_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static const struct clk_ops rtc_clk_ops = {
+	.determine_rate = rtc_clk_determine_rate,
+	.get_parent = rtc_clk_get_parent,
+	.set_parent = rtc_clk_set_parent,
+};
+
+static int priv_dts_init(struct rtc_priv *priv, struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	priv->ipg = devm_clk_get(dev, "ipg");
+	if (IS_ERR(priv->ipg)) {
+		dev_err(dev, "Failed to get 'ipg' clock\n");
+		return PTR_ERR(priv->ipg);
+	}
+
+	priv->dt_irq_id = platform_get_irq(pdev, 0);
+	if (priv->dt_irq_id < 0) {
+		dev_err(dev, "Error reading interrupt # from dts\n");
+		return priv->dt_irq_id;
+	}
+
+	return 0;
+}
+
+static int rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	static const char *parents[RTC_CLK_MUX_SIZE * 2] = {
+		"rtc_runtime_s0",
+		"rtc_runtime_s1",
+		"rtc_runtime_s2",
+		"rtc_runtime_s3",
+		"rtc_standby_s0",
+		"rtc_standby_s1",
+		"rtc_standby_s2",
+		"rtc_standby_s3"
+	};
+	struct clk_init_data clk_init = {
+		.name = "rtc_clk",
+		.ops = &rtc_clk_ops,
+		.flags = 0,
+		.parent_names = parents,
+		.num_parents = ARRAY_SIZE(parents),
+	};
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rtc_data = of_device_get_match_data(dev);
+	if (!priv->rtc_data)
+		return -ENODEV;
+
+	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->rtc_base))
+		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
+				"Failed to map registers\n");
+
+	device_init_wakeup(dev, true);
+
+	ret = priv_dts_init(priv, dev);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(priv->ipg);
+	if (ret) {
+		dev_err(dev, "Cannot enable 'ipg' clock, error: %d\n", ret);
+		return ret;
+	}
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev)) {
+		dev_err(dev, "Failed to allocate RTC device\n");
+		ret = PTR_ERR(priv->rdev);
+		goto disable_rtc;
+	}
+
+	if (!of_property_present(dev->of_node,
+				 "assigned-clock-parents")) {
+		/*
+		 * If parent clocks are not specified via DT
+		 * use SoC specific defaults for clock source mux
+		 * and divisors.
+		 */
+		priv->runtime_src_idx = priv->rtc_data->default_runtime_src_idx;
+		priv->suspend_src_idx = priv->rtc_data->default_suspend_src_idx;
+		priv->runtime_div = priv->rtc_data->default_runtime_div;
+		priv->suspend_div = priv->rtc_data->default_suspend_div;
+	} else {
+		priv->runtime_src_idx = -EINVAL;
+		priv->suspend_src_idx = -EINVAL;
+	}
+
+	priv->clk.init = &clk_init;
+	ret = devm_clk_hw_register(dev, &priv->clk);
+	if (ret) {
+		dev_err(dev, "Failed to register rtc_clk clk\n");
+		goto disable_ipg_clk;
+	}
+
+	ret = of_clk_add_hw_provider(dev->of_node,
+				     of_clk_hw_simple_get, priv->clk.clk);
+	if (ret) {
+		dev_err(dev, "Failed to add rtc_clk clk provider\n");
+		goto disable_ipg_clk;
+	}
+
+	if (priv->runtime_src_idx < 0) {
+		ret = priv->runtime_src_idx;
+		dev_err(dev, "RTC runtime clock source is not specified\n");
+		goto disable_ipg_clk;
+	}
+
+	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		goto disable_ipg_clk;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret) {
+		dev_err(dev, "Failed to register RTC device\n");
+		goto disable_rtc;
+	}
+
+	ret = devm_request_irq(dev, priv->dt_irq_id,
+			       rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(dev, "Request interrupt %d failed, error: %d\n",
+			priv->dt_irq_id, ret);
+		goto disable_rtc;
+	}
+
+	return 0;
+
+disable_ipg_clk:
+	clk_disable_unprepare(priv->ipg);
+disable_rtc:
+	s32g_rtc_disable(priv);
+	return ret;
+}
+
+static void rtc_remove(struct platform_device *pdev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(pdev);
+
+	s32g_rtc_disable(priv);
+}
+
+static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
+	u32 rtcc;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= api_irq;
+	else
+		rtcc &= ~api_irq;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int __maybe_unused rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *init_priv = dev_get_drvdata(dev);
+	struct rtc_priv priv;
+	long long base_sec;
+	int ret = 0;
+	u32 rtcval;
+	u32 sec;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	if (init_priv->suspend_src_idx < 0)
+		return 0;
+
+	if (rtc_clk_get_parent(&init_priv->clk) == init_priv->suspend_src_idx)
+		return 0;
+
+	/* Save last known timestamp before we switch clocks and reinit RTC */
+	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
+	if (ret)
+		return ret;
+
+	/*
+	 * Use a local copy of the RTC control block to
+	 * avoid restoring it on resume path.
+	 */
+	memcpy(&priv, init_priv, sizeof(priv));
+
+	ret = get_time_left(dev, init_priv, &sec);
+	if (ret)
+		return ret;
+
+	/* Adjust for the number of seconds we'll be asleep */
+	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
+	base_sec += sec;
+	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
+
+	ret = rtc_clk_src_switch(&priv.clk, priv.suspend_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		return ret;
+	}
+
+	ret = sec_to_rtcval(&priv, sec, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is too far in the future\n");
+		return ret;
+	}
+
+	s32g_rtc_alarm_irq_enable(dev, 0);
+	enable_api_irq(dev, 1);
+	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
+	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
+
+	return ret;
+}
+
+static int __maybe_unused rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	if (rtc_clk_get_parent(&priv->clk) == priv->runtime_src_idx)
+		return 0;
+
+	/* Disable wake-up interrupts */
+	enable_api_irq(dev, 0);
+
+	ret = rtc_clk_src_switch(&priv->clk, priv->runtime_src_idx);
+	if (ret) {
+		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
+	 * reapply the saved time settings
+	 */
+	return s32g_rtc_set_time(dev, &priv->base.tm);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
+	{ /* sentinel */ },
+};
+
+static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
+			 rtc_suspend, rtc_resume);
+
+static struct platform_driver rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= &rtc_pm_ops,
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe		= rtc_probe,
+	.remove	= rtc_remove,
+};
+module_platform_driver(rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


