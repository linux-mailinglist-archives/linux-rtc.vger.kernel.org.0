Return-Path: <linux-rtc+bounces-2632-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A9F9D96CE
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2574FB2A9CC
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D62E1D514D;
	Tue, 26 Nov 2024 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PTe1CneZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF91D4324;
	Tue, 26 Nov 2024 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621810; cv=fail; b=Qdo3g9RIDkHLyL4weZGVaG739fiukF2/Q5haj2w+Jtld9OnFf82dJrMazcgnqNflZY9/vZacobO/UGhzH2pJkSqLxfAKd29nwmygRh37RMaizmsLzV0cDlHYtz6jyesmB3Q6BStPnVVlLW+Nh1OgQnSz9PMxyvF/Gh6pIm2XMJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621810; c=relaxed/simple;
	bh=29cp7YMCqHQRGq0isxS4uMh3P4LeDbfkrIl+b4C/9ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tUPye6DflVfAeSNty9QKAkXAev5kcq/SWeYoc451Pi2NfKIYDXbL8v3nmBsZcqxSIIy6aBckfAXZKqwTFjCQwWH96zCIgvCfxwbPnCGT0K7Ch/SKZ3qjwcoPseas5TKW2X88dmGwAa0L4lRp93bhR0NNQRH2qT4OtuLmeURjt9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PTe1CneZ; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8g6KjCAZjk5sJq3w0FiwL1dDJlUc3X2hvv5AlT6GwoGOSFeU6d9a4IVGJbAG9pbI/uZLJlDa6bxbXkKfbP9aVotU56cQM46rAdCrQuFM9WzR0MceiK1QsgA19Df18m1VKGKQvUcq89ldETyV5+wyofGT/ef9Vy1toLW/HkUr5tEanKVZa0cGxLjWxXZMXPRDLQXOLk4YQoEvXSZAVOGnROLRTDj6o58Ulu5eIFHq3AwnvcVse/8DV2uoWMLqk0P6C/yAsIE8BDdwLIL8cj6z8XgRfvX6efll8LNRp8x5ZFp/iwMSUbRU8T6VOFnCxqLIiVq7UdzMwMWJWuDjuMLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0derk0A4gYZSIDHSeyION8Fpy0ivcixGlsvss2G4kU=;
 b=xQQrB/MxFu4WifoId+3Z+DtGCNrCx0/4deahkxqPd8GHJw/o1XFgdnPWQv/Gl/60GH534m910Op3Th9Eez1YWwaDL/FTpvOxTeOaJq5DUPTbTWP7piVkLKgANltp45HflMkdE9x7OTfHwGHbQKBcSbDVVPKluyLKZcwLFhvIPPmi601F5k+bA4nxgKVZTNfuZ76RGyuUUFIU3OifPhtdDAtx+ZvSrR7F/5u80Ww4dIj6zXREDPBugO11A1VhPAc5xoP3qC+KofdqDlhXpB2M6+CB1eXBhbYW6puC1rnmqtxJQJRqP8DDJW9vndJxpzQ/WK90LKug3XYjY1E9dRhg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0derk0A4gYZSIDHSeyION8Fpy0ivcixGlsvss2G4kU=;
 b=PTe1CneZwaj9qcQot+buXKJzvBCXPIABUIncHgnZC2AjPww8vfHo+dMKPPHYDWmGi6lm2MqHz5e7pkzcgggYybikpxaodChJa1OKbDIkbHHg2S/ppIXT6azTyR2+oB4QNE2weJR7xAx2C3bYWv2kR/P45ShOTJnomSxtRYVEjSeHeuRUIjgY8+mpl1u0ZJKqzoIioKqiWsHybyCYvXbQJEBJ4/d2aM1Euds9J8bO4UrBMvDWHuw5pN4hRecoe+Fw+OAa44ULoQnaUlotLoix5L65/6UWvQXPGbG0KHWiw7uckxwevWLMTmluhXrMYHnPsUXcWzxLyq114ktwxYs3+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:50:02 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:50:02 +0000
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
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Tue, 26 Nov 2024 13:49:40 +0200
Message-ID: <20241126114940.421143-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::20)
 To DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e826626-c862-4e0b-a45b-08dd0e107611
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXNDZlcyNUlTRlFRajFWSmpyYk9DOXBvRlpUOFEvUEQ1d2ljclpsbXRyN3Ev?=
 =?utf-8?B?RWo4byt4YzVYUTkxRFhaUWRrQ1NVMC9QVEY0bDBBdnA4czQ2b0p4NFlXM1Zu?=
 =?utf-8?B?Wjh4TWQzYTBIeStTeFN1bXlKVzVjdm8zZVZRemFCOUFBRVdNVTFqVVZxYVNt?=
 =?utf-8?B?KzVGVzBXeVVFdmczelZmUWtwdnJWZlZnMXc4dGsyV0dYalR0MlhqY1lsQzhu?=
 =?utf-8?B?YnIrbDlGUHpoV3dWdSswTlFzdnl4TXI5MlJTTFFWQWJ0bEhTU2RUYmpKVDhq?=
 =?utf-8?B?SkVkdzBiNkZQTXFPM2pTOENTanVrRjBvSTluY2MrTVFiVnJlcFMvRDIxTURL?=
 =?utf-8?B?NUxDQlo1dTZUanlvZkZ6cHJlRzdFTCtVdWpENWt0N1FVcVRGV2Fyb1BuNWxR?=
 =?utf-8?B?ZFM4dnBxai96Y3FTdkJuWmZINkFqTDVOSlRRMXlFekVvRm8rdCtiK3VMaWg2?=
 =?utf-8?B?dWpGV2pFdmNvUkp1SU9uS1l4K1NVam53cDhvd0FueTU5T21Bbks1SDdhWlJu?=
 =?utf-8?B?eWovbEg0eGFDRnNtT2VQTldaWFhFWVR0YjZkdHR1WXFObVhUR0dZeTFxUXZh?=
 =?utf-8?B?RmRoV01MTUtQdFFVcnBZSE56ajIyMVNuMnJFS1ZicG5rQ0NtTGZyYzlUVGVI?=
 =?utf-8?B?WVU5RThTK2p5YWRUV1pvWStOaVc0VVpONWdGRWRtd0RXazNnaVE0VmQwNGh5?=
 =?utf-8?B?WTc0UmtuTlZBSzFaSVV2aUpHU0dtajNFMGl5UFdDOVpkSkVNK280TFR2Wm9B?=
 =?utf-8?B?MlQ5L1ZTa3Y1THMwckJ2UXU0UUd1bjh5YjVDeFZBd2lOMVZHYU5CQ24yM3F5?=
 =?utf-8?B?ajJ2VUJLb28xN1dyZHUyVDVJNk5oY1dPbGk5ZDRDT0JXUjhZRjRZZEJiTUxv?=
 =?utf-8?B?cGhhajlManZGbVdQcW1JMjNjOUpEVStTaTFJZmJrdWlmc2lTRjVDSEE2bTJr?=
 =?utf-8?B?Wm1wSmxncExaOEVGMlVULzJlcVprdVN5WWFkSExZS3ptNmxrdXI2VzlJTTR6?=
 =?utf-8?B?UFlIUGl4Q25ucHoyREpNT1A4Qk93ME9kTlRSd3Zvdk5CVTZDRjlyTTMzR2VY?=
 =?utf-8?B?dlpyY3BTbmJpeGRhSWtzTGMvYWFVU3ZhQ2YrWnl2bHhMU1VuVVd6eEtjakM0?=
 =?utf-8?B?ampkckdENjVnN3N3cFhMNXU1bmhPQUxaa1ltZFUyNkZHN29pRDVPQmEwTEls?=
 =?utf-8?B?cDBnaURiV2ZJUjNHMFYwSjZwb0IvZW1FdjRNeDhyQVhlc3gxNXZvNWkvdEU2?=
 =?utf-8?B?M3ZKN05YV1pLa2tGOVhWYnRpMUZtZEtKcDR2RTFmcjJ1a2dOQldBYWp4Mmta?=
 =?utf-8?B?OVNxTTI3QW1RVnFiOTVZWDRvUUIydFJWd1NSTjd4UkJ3ZFQ4b3hGaHpnNU5N?=
 =?utf-8?B?YTFKN0ZNZU5qWXYxWTVFNFF0L1RiTnRRR241T0g1aDQ2SWpLSkZ1YnJUTzNM?=
 =?utf-8?B?Qm5YcDNVWVVNeVRSSDEyM3Z2Q2xBdzhlRmY2VVVGZ1UzemhvMy96T2J2VVpH?=
 =?utf-8?B?cjNkbzREMEFsRE1QdDJKU3pxYXVTOWRrMWJPNVJ1MitkdERZR3Vad3JvRU94?=
 =?utf-8?B?MUFsZTlnVGVsc2ZFK2c2SGdTNWFhU2IyT0g2WUFuZDZCL1FNaTlnam9NOStD?=
 =?utf-8?B?cXNkNG9PN290YjIyaDRTQVlpVVdOTUVJcTNjU2lKblVVcCtPbmxxUjg4bTFs?=
 =?utf-8?B?dHlFSjV5T2J5TVY0SjB2V0p0aGRDRVFXRUNqblFzR0l6RTA4a0FqNEhjenRH?=
 =?utf-8?B?NjVRa2NKS2hMUDZEeDBhUnF1N2dGbStFekRYVm5jZUJWRFhTQy9hOUJEdjdE?=
 =?utf-8?B?K25aNFluN3N2Mng1ZlJVdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzBwNzlIbzUzbW1sUmVxT003YUxHenFTMjFvNnYwMk5aWENnaTVSWGRFK2RF?=
 =?utf-8?B?eGhMTWhWRmptU0xiRUJudDlMUzREcHlOc0kyUFlJS3FkQUVOREkycjErL2Nv?=
 =?utf-8?B?SEFtNVBkenU1SlJubWVld09vdDNvWGkvMGVRYWxPR3pXWFZxcmhnZWhNeWUz?=
 =?utf-8?B?VmZlSjhFKzhCMGVIMFhOVHdMZXZZRUNHd3Rla2YvZHdmdGVBSkQ3TFBEK2lT?=
 =?utf-8?B?NjVLdTZrMkJzMW5uQmcyYndyTk9EOGV0aGJyK1luaDBGMjg0cjVwbE5rRW8y?=
 =?utf-8?B?QnJjSTdDQmU1WXB2YnV1NW1VeVRHRGNLZHMzZlptZVRFVkpXOERCVTByVlI0?=
 =?utf-8?B?WjZPZzVwRXdIWXdPY2p1UGNkc0dvVGFQRU80U2VteC9KMERNaEdhczR3eFA0?=
 =?utf-8?B?UkV5UThZZUg0a0xDWmk0YjNJdjQ5T2ZYUmVqTW9VYW9qZXR5NlpQT3FDZEJj?=
 =?utf-8?B?UytKMEUyNk9BZFNCNXlURXhvcitwRUpIMENoVTZnYzJxaHRUb0hFUXFRMUNG?=
 =?utf-8?B?NWZQNkc1b2hrWHJYMG0zOEs4SVhDVVlNd0VOVkJlaHB2SUlnL2pjOFNRVjd6?=
 =?utf-8?B?ZVNMNTM4NlBaamVpU1NNbXA1RHlvUzV0RnBVVEo5cFo2dTNaeWwwSkdUMlY0?=
 =?utf-8?B?Y2FFb3NsYW9vcUhqeWpLWGRZSXFJZzZ6cjBESGJ1eFB0TmlkRWdhbnBFVGpC?=
 =?utf-8?B?SWhmemgrQXo3WkoyUnRpL1VrNGdveE15SXBpaVNYTmVENnVXTFZkbUNJRGxI?=
 =?utf-8?B?SWdRQVhXQmxBNC9sN3BZUzA1S01VRXlZYmc3SkJtU1EwMjUwdTg2bXRVa1R5?=
 =?utf-8?B?eEh3bitja0k3S1g0MVh2bFkxcjVPc1lrQUNYd3kvU2hGNjNTQ0ZrWGVTODVs?=
 =?utf-8?B?SXh1SUlMMDFKdUNyU2ZLQ0Y1ZWxYdlVDQThqclI1Q1ZlRi9DZWtFUFByTVdI?=
 =?utf-8?B?ZEh5Z3ZWeUJsbkpucFpSNmZTQlkvdXJaVEw1bGNoVTc0NkJBU3RwQXFRTnZS?=
 =?utf-8?B?N0tMdEdLanEydk1Kc3BQRHhTTFc3aEtWRWpRMEhYdmdZQXFWODZUWnJUOXAw?=
 =?utf-8?B?cGVNZVppQUlUcExhTFRmU05Sby8rMldWRW5hcURCNHlVQkpNN1pJME14MFJq?=
 =?utf-8?B?b2N4ZFAxeUIrUTQ4OW1pT0I0L2gvZHoxRXJlb04rVmR2cm1Qb3o2Y0xVeVdD?=
 =?utf-8?B?aTdzcWxoTmJ6ejlLYVJQTXEvN3l6b1BoYmU5TjhIRXF5clBTYlJ0OGFQWk9t?=
 =?utf-8?B?a0loSXVReWVpdzJCY2tQUm5OaGxlcXRuZyt3QnpEVi9Uc2JRREQrTG9CYzM5?=
 =?utf-8?B?UnNGVk40TjR4OVl0cGtNZmxxdGdta0t6ejBtTGFEcTNGTlRBSE45bzcxWW5k?=
 =?utf-8?B?QW9ncVdLUlBIanRwTnliK014aVVmSEdhRnM3bmovdENldGlsbTZmQkVGK0U5?=
 =?utf-8?B?NlJKRTBEVFNxYnYwbEtsNUZVMm54dXhLUS9lZlB4NGZwNjVKL3J3ajZzTmdl?=
 =?utf-8?B?aXNhZjBKZHJNWkdTaDgyWWx5OWxCTndYbE0wQ3JRSmtRd1I3Z2pnZ1l6ODdY?=
 =?utf-8?B?UGt6MjVORGo1V2NuemFLeERJNksyTHJhazdLUkVYd05kNDhtNStsenQ0NGRS?=
 =?utf-8?B?V25QMjljUFNHTDBUUFYrQXQ5TVVWV2VSeWU1YmxYK25VT1hRSnF6bDRYTUJm?=
 =?utf-8?B?SWF6R2YvR1FOSXhGQ0kvK2FHWE5QRzA5RjI5cVYyWmF0N1JMcTJWSE91Vjhy?=
 =?utf-8?B?TURMZXBXSFovZ25MbmtoSlNQWTR2ajR5Nmd3N1ZZRkFRanZTTmladnpONVFP?=
 =?utf-8?B?RWh0RWtZWGhObXlGaVRXMHZsR0tIOXFUbWtIa2hMZjF1REpIQWIxeFRjZndO?=
 =?utf-8?B?amVUUnMzM3puY1JhcDI4S1pJTnFoQnNaSUpUblBnWFVOVGtrbGlneGc0amti?=
 =?utf-8?B?MTk3WVV2VVNIVmJCUlFacXZHTEJkamFRa2g1Z1l4UkFxbWZGRVZ2THp5SnRT?=
 =?utf-8?B?TWgvc2xrLzR2Sys5OTg2YWhpV2E1WTJOZ2lBSkxMcXhNTHltVGw3bXpYR3NB?=
 =?utf-8?B?aWtnckwra1ZMNTRZdHR4a2dsemFHNTFoY2xaR1FWRmtFVHNMckxnVERacUg3?=
 =?utf-8?B?dk1UbjluUUh6RVpSN3BpOXQ0d1kzU3ZYejJFL3h4eCtWbnJTdkpGMU5kV2JO?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e826626-c862-4e0b-a45b-08dd0e107611
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:50:02.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU0UOndJ7zNu7Z7OYRCxfb3UlLG0amZH3IBIIkJDycitoWMP1/YrfnHcpPZcxBa855O/3fbfqchyj8XcMVEIlop3Sy9UL8745HFWo21urvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bfef98226d9..991a9df6819d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2763,8 +2763,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
-- 
2.45.2


