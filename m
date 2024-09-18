Return-Path: <linux-rtc+bounces-2018-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED897B8CC
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 09:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79D812817AF
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBE9166F1A;
	Wed, 18 Sep 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VRNpaNr6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013061.outbound.protection.outlook.com [52.101.67.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2EF78C7E;
	Wed, 18 Sep 2024 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726645951; cv=fail; b=T9UULe6OgrtDkdq6tckz+eI0WpO+psGy02O/kr0EjCegY/k1UlvWWt5Di8jypvGK4wjTrlub8Z+nRtTXeNIDSGvKW859ekypzhY15ilPfcKtbfUyyeMNn7XC1GTk+mW6nT2Ob9cEk300FNrYSThiQVxXfv0YI5x7ab2cBouFYSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726645951; c=relaxed/simple;
	bh=YFUpszJUZGlR/TnGy9E/fwSxKhWf6hRmKvdOU//bBrg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=usc6epG3v/dEUZYYLb+dsy6TeNF4/Bvc2G+AM/3/pB+h/Mv7Kl3QExUEMnL25VK9M2gxF7ATC7j7IAjW7Jz1vyaM3FOxkmqUvlyhZwikvOHtktpBnRMv7Z4Uf2nVzkuWGge4KjsrKj9E9xRhUSbF71zRdbpgwp2bHaGKReoTlDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VRNpaNr6; arc=fail smtp.client-ip=52.101.67.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgL5Oar6/8oJtX8HbmH0ncf9PsL4MpHWkoOvCj4GTcnStd0N1IkqwcgqlG2P9v5tfEOrAE1a3hHIhZnlLn+0OvK9TVIOflTxM+2EMQWZEbPETnPuNXHQrHk8KpNj4L4ZzW6Vx277LApKsMQ2Gmiie9VYcE5CLGN/s0oCwMH++YbijTg1w+Q5/wP1romt6wgJ/9AgYWSaLlMS1v6e7O2+bg0+N42+KLJT2eYlNp+32gnBBs4KBo9rWxegkwa0O5UoN7KYM8rIupeZJgoGUHEKE9E3rADNuI0xHF1/ooecAyVIq7UCZ4WBqwFKDLRcKWenIEmo5tgCflo+cJdmVTHC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul93/Gs07T/MNR566CHt4ad6hQlig5T31qYRt0vzpfI=;
 b=etk5x9iHDIfy73ugVzwJF1DqzimY0KdyoIuEQ9pIPEdNn0s+GPkEPcRXJAUPrYse8PtbYtcjWdPZNx+EXC9aZwMTibYn7spz9eeRPG8F6Dd9/LHJjiHBRVOVXkn7vatf24kHmuV+9Y0B703paqzusJARIlhVT9ZTcYb9H8isahd20ZJGGYuNNWjOkSyrfeSxOVkBD8RP5l79IDt+W5mQD8NZtpgDg9A3JatxOkvDkithCc5enBkvUd7iT/sp9F7IFZtCH4Yxy4XGY+KFXiPHgfV47QmyXa8WrzzTg8V6fuTq4kPoIDF6GSZU7UJtj4wgGY+NaulmtaFI7AH9NCPqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul93/Gs07T/MNR566CHt4ad6hQlig5T31qYRt0vzpfI=;
 b=VRNpaNr61E6WgSpK8fTjeFevU9m4QrK8VusUVQlLHQ4IEAETMdfGgSWC4aLieuoKvlp7GmSxuCdoB7C6sm3P+EbhFWBruyttaUeS1RyWdckzqKhp7zWOuEA9j6fK/VuwOu3zs7nZyVAKiJE9fm5ievvK2rSugqhzKYugvkT6SDk7RIviPlJvXJbgHANc44dqWcUW5J1AwCbqUlCgF3wYQ2Oqa2CN8x4HGOHS4x01YSERGZmIgDLwGizaQ87U5ibevEBWs4xYorn118j1n2r+912sxKcx38GGK97GA1ek1xoEkAxYVhKAFOqPxI0F4sXD9PGDoi2yTnDVrDxPQC01vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU0PR04MB9634.eurprd04.prod.outlook.com (2603:10a6:10:31c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 07:52:24 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 07:52:24 +0000
Message-ID: <9ca5cdab-03f6-4102-a5f7-f93ad5e2fe06@oss.nxp.com>
Date: Wed, 18 Sep 2024 10:51:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
 <51888969-5b0f-42de-8bbf-bcb325f642ea@kernel.org>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <51888969-5b0f-42de-8bbf-bcb325f642ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR08CA0014.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::27) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU0PR04MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: fcecffd4-2d17-4fb8-ca57-08dcd7b6d565
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDlMT0JkMHN2aFRUVnArZzdhVVMwVXlQT2JWdDVlbU42czUyU0ZwUmt3MEl4?=
 =?utf-8?B?MS9SZkYwMFViR056VG8xd2crcTk5Mk1qc25MRWVmTVRTaFFOU1phak4rVDVU?=
 =?utf-8?B?d004RGR5aHAvZ1h2bzdNQ0Y2SzQ4UDBVQjM1UXJFVjY0TWk5ckZDdW1nc3RO?=
 =?utf-8?B?RjBsSk9ObzZYaitSQmtOckJxRzNacWVUZXNKK1BYWm82Z3UvbWVKWmQvd21W?=
 =?utf-8?B?b05pYi8xYWZpWjJYZU9CQk1wbFV4eGFUcStmVm1CY2dxOGdwWUoyV29SU2Nt?=
 =?utf-8?B?Mk9sVE1jSmNNUzBEd3FKOGpLN1AyNTBqbS9MVEZJbG9pbGNvS2M1Zmx3a3kv?=
 =?utf-8?B?NkMrSmNiNnRFRWxCajI5SGVLbGl1cys3T3c3SUw3ZU1rcEtpKzIrNjB4V0cv?=
 =?utf-8?B?ZWxneHIweTNxRG9wR0pIT0pycEpNN21IWjJtWjl3Z0sxKzlNT2ZkSlNPMUtn?=
 =?utf-8?B?WlNWVUlTMDNEYVFBUWR2MWtOTlBlUUozU2pMaElYMTZBL0hDSTNndzBrQ3Fy?=
 =?utf-8?B?K0JCemd3T3drTmNnaldxUlV4cnIwZ2dxWWdvTDM1NjltSThZTVZ1cVpNQ3dx?=
 =?utf-8?B?dm9lR1MwMFU1MzloNVJrd2xzSmNDbFNidS9ERUJRK0Q0UXc5QWZQK29MajFR?=
 =?utf-8?B?RGlGbko5Q2tvNFZhQjc0VlZiQzd0dWVPbzN6NlA1THB6NWZKUmZQd3FYU1Ur?=
 =?utf-8?B?dmhGcWY5N3F0c3NES0VsVjNKNHZkYjBVQVNraWpvd2xOTzhPVmZtWVFTZmll?=
 =?utf-8?B?eFFjM2pXdyt6ZVhyMHBLT3RobGhyZGc3SjEzcDVYSnFuaW1Vd25ocGVnc3Ba?=
 =?utf-8?B?TThYMkFSbDhwVFRpNGwvM1RCMUtLalhRc1JHeUpSOUdrVDg2K3hHWUQzVlFr?=
 =?utf-8?B?MTF6TFoxM3RhWVpGVDRaVWpLdUlmd282OVIyQkVYZUFZNDRtQ1Rpb1p2RTdk?=
 =?utf-8?B?aGVhbHdEZGJ3Q2svY3h1K25VZVltYmh2cmRiS1M0WnByQkZ5VU1PS001aGpC?=
 =?utf-8?B?ZmIvZkhnKzFkQ094RXF6V0pFNWRpUFFuY2tjQ2w5RGdqNGhMdndZcXY0Ni9k?=
 =?utf-8?B?MG1wS2MwMWN2dXgrK1d2LzRFcVNGZHpsQjhKY3JuQUZyZFl0NEVDaW5xQTZJ?=
 =?utf-8?B?dTVhYzR1L2ZJY1lsMlc1V1BsR1Rib3dEc3FMOFp3UE5MQ1dZNWVyN21BT1dm?=
 =?utf-8?B?ci9lakFOZ1cvOS8zNGpkWmNtbW9yQTVKNkFMSHRQTVU3bHQ3eTFqQ1JMSXlt?=
 =?utf-8?B?WlN2bW5rbHJOVUtHMHgyT1A0azJMYXFodkVmNjFBVXZYSHR2ejhQWWRCbWRh?=
 =?utf-8?B?WVozR0FTRm1lVFdDZGM4VWkrek05VHpTT3JrTUhoZWppVnI3OVhPaktXRmsr?=
 =?utf-8?B?MmlKWG43SE9qWG9VR0xnelpkMUFHaFVkdXNER1Q3M2gvNGRZSlkvTnVJaEZu?=
 =?utf-8?B?WXROV0JPOUVjV0VYSk9KdS9ZeXdraEhlU0UrNnpVTjR3K2JUQXhqV0NyUDVj?=
 =?utf-8?B?VFJ6TEU2d2FLZUE5V1FVWTRYNFp5amlMcjkzaFd3cmVESzZQZnBxaXVuY3N5?=
 =?utf-8?B?Wlk2Q2ZQbkpodW56Y2I1Uy9wQm9IZlRoMkxsMFR6cW1neGNiQWRpazZhc2tX?=
 =?utf-8?B?TFcyS1M1N0sxODFyeHZCajBtSTRYdStvMnorVmFoaDJreHV1YkZUc2NrcGZE?=
 =?utf-8?B?VWVwbVFHV1dmZ1V3VEtqZlBrbTNwa08yU3dhUzh2M1Jub1B4WDFkcDFOUEVT?=
 =?utf-8?B?TWJOSlRpTnk3Nm53eERyUGJoZU84aXk4cE95V1I3S0I4aDI1MTRMZnFmb2hO?=
 =?utf-8?B?Q2JsVURXam5ibXVJMWNmdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVc4T3JHYzNNZkR4blRUSFQxcWdYejRHajU1bTNlMHV3OWIzOTZnUDFGWHFF?=
 =?utf-8?B?T0lOZVpZSFZYSU40bjZBWXVuYU5SUkFkR3pzNEp1VGY5UDVNK2FCMlZlMHh6?=
 =?utf-8?B?ZW5lbUFVaXI1V25uQVY4ejFNR1VVVUp5UHBFaC9NNDc2dXhJU0hSekEvb0N3?=
 =?utf-8?B?MU15V1EzcTMwdWRLME1aTXJMcWRxR0VOTTV0dHIwbU9jQzltWitzQ0ZLRk44?=
 =?utf-8?B?YnprRXVxbmRId2JDOHdFUm5aR1pSUmlucUR1RGJBejZBcFEzYmhxRU0wVTEy?=
 =?utf-8?B?alR3ZGlyazZyOXhuMWJ1Z1gwMU1iY1JkZ1lhaXhQRlhKTVpxbm1odjdUNngz?=
 =?utf-8?B?R2xoVThTTHhjMFV4ckU4d0FzS1pQMjMyc3ZTVHNKOXE2MHhVTjBZRWg3NUhV?=
 =?utf-8?B?MWVzTjZoczJTZlo0akhJcE5naTJnK0hxNjdQaHh1Y2xYSFJBeDBrYjdvcGVQ?=
 =?utf-8?B?UE9NcHJGOFBVbGMwUlQ2azNXaXhoUzI2SFVrZGRXSU96bkpQWFdNNjZWUHhp?=
 =?utf-8?B?emlPRE5aQzFHTWkyRW1sb0RtQWVmSUtQME5nUEZiL1oxVjlLNStFVnh5V1ho?=
 =?utf-8?B?VDNaUHFlYktJT3F1MmhOMDVaSnR3a25CNE1ZOFU4QWRLeFBuNWhVeFZOODUz?=
 =?utf-8?B?b2FiTTBqVlhudHkrNHNkUGVoeFA3a0FpNjExT3VRdFRMN2Q4RjJrejZqMjR2?=
 =?utf-8?B?N1lPQ1YrZ0dERWRyVzJBRHNsY0ZjYjlvWFR6SkhlQnd3RU5ObjZWd2w4NmdZ?=
 =?utf-8?B?dGxSaUU5bjRwSTF5VE1ZcHhSM2h4YWVmazk5Y0YwbVRUWE54OGNWRzVTUkdI?=
 =?utf-8?B?NHI2RTU3RTJwbkdMTDg4T3hscXNLbU9obnpMSnA5Tk1ydi94NzJkaHNJTysw?=
 =?utf-8?B?ek5NTGZDL2dzMkNGMmx4Nndzd0VFYjlldVJzWVN3OHRXMHRYU1hSb1JuN0N2?=
 =?utf-8?B?aVBvbFN4ZVdjR0tMb0wxWWk0UlBiYmtYcVNpK1dnV3M2NDF4WTkrSWxiczhH?=
 =?utf-8?B?aGRPV2xkdjcyWm44cWpTS3FmYitMcWVXQVhMcjBoM1BpbWoxSDZNRGY1bkpZ?=
 =?utf-8?B?ZG9QZ2JYYm83Zy9hNlB1aGZvUkh2U0g2UmZsbW9JZDhoVmVBN1JXY2xaSnBt?=
 =?utf-8?B?L21sT2x3RDEra2ZIQmZnYVJBMEVES2tWc3cxUExzek9vSVgvcnFQQytEZVdX?=
 =?utf-8?B?U0NzVEJ0UmZNdmNPMmEyOWZtd05rS0l6WUJWaXg5K05GenVrdW5jVHhtTXpw?=
 =?utf-8?B?ejhxRzRCaEIvZm1WeDgvSDRYekoxNXdMVUE2TWFQVStjcWZUdjZzbUl1TmFs?=
 =?utf-8?B?WWVsRDNzOW9FTDZZK1dwUUl3b3ZJMVNCYlBnVUtLQU92ZVNucTc1R2YyclMx?=
 =?utf-8?B?UWIxOEdpMDRtVlRxaS9MMmNnYkxaVXFBWlVzM2l2WmIwVzNKNTNNUk80UzRa?=
 =?utf-8?B?UXJqTk53Y1hBK1lwdHh1THdVNlFINERkb1REREw2Z1VDQmFOZTlYUUJpbXc0?=
 =?utf-8?B?VDVGR0UvQW5BNDJyREdXc2FaQVRmWjlDZzlvdVRwSDMwTEE2SG95V09Xb3gv?=
 =?utf-8?B?MjdTdkVGd3drbVJPZFFaWE1VRFlqS0tsSGdKK09ZWFIxbXN6LzV3bG4yZGRa?=
 =?utf-8?B?R1N0ZVdscm5WazNZTGo1ZjVxRjhoMGdTWDVpMWs5UG9GTVkzRWVhUXdHY09i?=
 =?utf-8?B?YXNnN0tUMXpxM3pRTWZHc3ZyUUdHOWJsRDU3Snp0Yk90U1FQZmV3K0RJUmtI?=
 =?utf-8?B?aXUzZFBzNndOMGtxK3V0TjUvbmpRWkxwODZLNk9vQ3FRd29lY2g1Z2kwMWUw?=
 =?utf-8?B?VXluNHZRTS81WjNEQnBITnNqTS9FeUZnWjN2K1lwVzFzS005bEh4dU50YTB4?=
 =?utf-8?B?SCtpSzNZWU9ySDFSMko0REJ4WGxKdHVVK3Facnp2ZTdEWkcvcUF2VXlRM01v?=
 =?utf-8?B?YUxZUVZkaXN4eFJFbzhaVnZwRkV5dmplaVF4MTNuQmlVcThpdFlmaFJmalcx?=
 =?utf-8?B?U1pyUmxNczdpZ3RWbWcxNVR0cWthZjZKb2QwZUk4LzB6a203ZFpVellQT0tx?=
 =?utf-8?B?Q0ZLK1hRUUZQdDJoRTl3b3piek9iUlpLbFVxWHFqNnovbE9Vb1hJcjFFdU9L?=
 =?utf-8?B?cHJDS1d6T1RRcVdQdVZCUXNYT2ZmWDcrL0JicmE1cjN4MytOK1dFSWpJeFRY?=
 =?utf-8?Q?Z54ejoZv3KIK5YJ9kzn0T7I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcecffd4-2d17-4fb8-ca57-08dcd7b6d565
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 07:52:24.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chLidToNCqSJ3Iu9eZDZoQvjP4MQxxopTFSa8uBlRV4UyHMLrIIlhxiBvkDr57dYSS50cq/ymCeWUKkeVpIfRkOg8T9bOabrUcbjajy6Q28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9634

On 9/17/2024 8:40 PM, Krzysztof Kozlowski wrote:
> On 11/09/2024 09:00, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> The RTC module is used to enable Suspend to RAM (STR) support
>> on NXP S32G2/S32G3 SoC based boards.
>> RTC tracks clock time during system suspend.
>>
> 
> ...
> 
>> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
>> +			 rtc_suspend, rtc_resume);
>> +
>> +static struct platform_driver rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= &rtc_pm_ops,
>> +		.of_match_table = of_match_ptr(rtc_dt_ids),
> 
> Drop of_match_ptr, you have here warning.
> 
>> +	},
>> +	.probe		= rtc_probe,
>> +	.remove_new	= rtc_remove,
>> +};
>> +module_platform_driver(rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
> 
> Best regards,
> Krzysztof
> 

Hello Krzysztof,

Thank you for your review.
I will address your findings in V2.

Best Regards,
Ciprian

