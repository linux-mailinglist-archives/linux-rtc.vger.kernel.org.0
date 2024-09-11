Return-Path: <linux-rtc+bounces-1931-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B44974AD9
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 09:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55141287E4B
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 07:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961EB13D502;
	Wed, 11 Sep 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A/TesZyZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5613C80A;
	Wed, 11 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726038049; cv=fail; b=bNP0JymEu1FSerPXlWxuQeknRG/FIXnutli2hU27qscarZwUdA/WYucbfa85hRLYd83o1j/NBiU7hWztzPd0MG6RxRdNIiTCJgmrAxORRgHzQy0TzpTL4rYhLCtBGq8oDPTKK5pwtJ6j1yxpVve5E/PAmRsjnxAn2X0Yu962O1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726038049; c=relaxed/simple;
	bh=8i8thz3NXSmsWI6AEtypGc1RDUtskOVriGGgPNPEzfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uMRiFdqWnIIjjjfksYfdONpIJMvzR/TB+8gnhe7J5TxHD60gV9EOEi3Z0PUFfVASo/4lEzS2WASP+Ilnfc4te+XYyU10Ej4m1BeHOl84crFbXghQOv0cEhpgqVQVcROC66A3OC/CBTnKUhOZ98cKZX2jyY0pLIiIV9KjiTv4YyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A/TesZyZ; arc=fail smtp.client-ip=40.107.105.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rITl0borFJl3URlGvJnDM0ox3Zsu69/1oVOjPdZdEIeYCuwT71PUvjSDVpU2BjO5J7idTgbA0UL84BAiBenPr2jjEJsO7sclAVMMIT0w1ZxOT9xEOWJBM628h9V8n3JOGQ+Cvwbng87fynMyr1B+H2MRnQrrj94quy/lA4gE9rpIhxGf1Nm7U8VuueMxgJ8jvy3URlg3XWvRxPfYzjldC53FnWLDgNBrnl455aMGPDCcT/PCrvFCQ/YGwdMwTWDeOdILtFEdKRbiS9TwE3dz6cHc3hBTtMo1PFWu78W8OAqkMK7G1Xo1kyRDrDEc2B2YYqXYs43hwA/4g39JZosmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PAMSGH8txMMBpXJwPyodEagL9nov+U9fFwO3UOKfZ4=;
 b=V+UPZ37fBja9gDOO10sM+Yx18UhUHC5F++kb4jdiRmsXBWurILyjGcUZ6doSL/4ag2O4Ir32C0pAMLuY6QGupYGJLYoXWMhoJndvcou2aM55rFy2WlUO4I+xPF3eN0kOCj80wKZfkCjjHb7Y3nbrhZkmv+r0HM9a7M3SYr5LbX6sDnvuVqIzWmQgwKp5l9AxUkk0bFefMiMp7VRyuhqGr2mTYdcf5wn3jHAxjmUK+wPba6u1jAG63PR6bhl6TK2/q8Fh7A44+g9WO0/YQEojh4AKGTVKzqKV9YN9Rm/pfI7dC34YN7UQkzRtleNiSB1y9r9ONPJgDD/ew5I++J6aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PAMSGH8txMMBpXJwPyodEagL9nov+U9fFwO3UOKfZ4=;
 b=A/TesZyZRben0ndhPG4fj0a2MHnXQcvvFdMADFK3Cmhb2DiZSHdEyEHAmocxz/WhTMNeB1ASia14VUzYOKFjQXJOcz15hS8kKEA5UzQPFeBKHNvtZ4VDpGZyVBWiqvoUwzLKxjaf0/svjgE7rf368xhDF8xspW49peX3VY4s99IHx0CpbpcBSwd0PK5BTehVlaWKQYjZRK29MzSXTf8FW/mInZPGO5iUWokhSXF04fXkVq8kNeOCVuMu4KEcsxRsIk39wFi+2+TIJRGoD6mb0ZCqM6AELT+2SHAU+ZJru51WyEjKEWOaMocIsuqrOMdDOSDqzMwFDL7e7vlF3oyZRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 07:00:44 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 07:00:44 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH 4/4] MAINTAINERS: add MAINTAINER for S32G2/S32G3 RTC driver
Date: Wed, 11 Sep 2024 10:00:28 +0300
Message-ID: <20240911070028.127659-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0127.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::24) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: b15954bb-c847-4d32-6458-08dcd22f7474
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzZEUzdVaHdlSGdOSEhzWkpnMzZVVCthQ2I1OFU1Wnc1NWVwN00veWdYNjcx?=
 =?utf-8?B?L3FCdXFrM3Q4TFBaU3N4QmZoV3lueXJ2VWJQUTdEVHZ4aDlGN2VCZVd2dlpR?=
 =?utf-8?B?NHAvTkdDcVBmdlBIalFyM25STUQ3YXRVKzJrUGFzdzgxazlrTEZMcy85V1hX?=
 =?utf-8?B?UUs3YnVRRlZCMnM2dWVVZCtxS2prb1Fnb1dHZzBya3ZzQTdYK2tDSkFYZkcv?=
 =?utf-8?B?blFsckw2bWJpdS9Cb0Rjb0dyL284anpOcmhSa25yTjJSc2QxMGF1N29kL3lJ?=
 =?utf-8?B?eUdVcE5LNUpsQVpjd2JWbCtVTFFMYlRWeTl0dDNmMWluMXFRWnFkcnhIMGJI?=
 =?utf-8?B?UmoyNTlyLyt3Z0g4QTFIUVo1RVJnU3ovaEoyZUFSTzg4SitFS1lTc1RrT0xt?=
 =?utf-8?B?Wk1iZFQxa0V5Yk1UZmE1ZklwcklTMjFDY0Nsb1VJWXkzREZBdnpsSG43R2h5?=
 =?utf-8?B?SGRhSzZtR1BKRmJOY3lCcml2OUIxL1lsOXRhaG9rcHNVZzA2eTh4MTE1V3Bi?=
 =?utf-8?B?ajc1d1FReGlaUTdGMVNrM1RBaTlvY1R3c3htUVVEVXAraDZiOVk3U3Q2Yyt3?=
 =?utf-8?B?a0ZoUzdCQmw1cmZwNDYvUXhzYUE4YktpNU5RMXdtczFIL09ZVjVFa3czSmRq?=
 =?utf-8?B?dllGY1p5WHo2YnBtcFFaU3dINE1iVzk3TW4xR3AxeUVzTkRPeWlibUc1UWJo?=
 =?utf-8?B?YmVFVHZ6WEc5MlovMUk2VXd2N2szSG9BbS82ZVIrUGVLZGlkOWJuVlhFNjg4?=
 =?utf-8?B?bEhYbEY5NlVneXNMSHV1WHJOWUdCbTRNYUgwaHYxcitKaTc5NTB6UGluUmox?=
 =?utf-8?B?REtPMmlQS3lOK3VlK0xVQ0xHem5lVUluM1QwTXVDMzVyVHBKUmhrZXZPdVkr?=
 =?utf-8?B?NE5TSWNhakpZdTZsMlJyRkVNVGFac3pXcW9nd3cwWWdwYjhhRkpTekRMOEhN?=
 =?utf-8?B?NDB4SngzK1dCTkkwTjJiSkVQNjhVeU5UM2JDZVA1c0dPYmpwQ2plZHlBeEVz?=
 =?utf-8?B?K3o2L04yZFRtV3FybUMrSWkwRDFHNG4rN2M5MkdpYmx6bVBqRkNaaTg3QWd1?=
 =?utf-8?B?TGt2ajdjZFZMNGk3bkRac0VJOVg1bjY1eVVDU0lPcW5vWVhoTGwxTHlYaVRv?=
 =?utf-8?B?SG1wVEhlVW11Ni9yNDRYYW91bXBiSnhab01Uand4dVI0VmRnd0lZOURqU2Jh?=
 =?utf-8?B?Q0ZPV2NXQjFUdHczUGNPOElNeUxXRjk0ZmxabS8vbXRrV085QVliMVhnbjFP?=
 =?utf-8?B?Z1RiZFNTMDJQNk9sSTU0Ti9MWWpMbzhOVzlTS3pTK2dHUnJsTnV5Z0QybGFn?=
 =?utf-8?B?UDJLcDlRR1ZpU3YvbWdrOUp4ZG54N3RHY2NiY2Y1VDN3S2w2UmtkZ2VpN0NM?=
 =?utf-8?B?cnJZc3FKSlVUN2RhdVo1dTJvWVJxQTRKTDJGYUFZUktHdE1Pd3dIZlBYOXJu?=
 =?utf-8?B?ckVWKzhONnEzcGhhSFpaamhpbGtMdVRhWStGdTE2U01SZXY2Y3p2YXUzdlBD?=
 =?utf-8?B?NXgrSGVwLy8zY04xMC9wZXgzWCt3M3I1dmlJS2cvOXFKalptOWtHU05LbXdw?=
 =?utf-8?B?UFNINnFiRlpoVnJkNVR1N1NPWUl5VTlON3l5TitvVU1XaDlSM0xMSGdtUW5y?=
 =?utf-8?B?aHFnSGk0ZVpFQ203dGlQczViVE8wS2FacTlTTmpGRW5LZUUxdmhnbGM2MTMx?=
 =?utf-8?B?QnFnWDRLVEhYK3RIQkF5QjA2azdQeklObytBZk9pOXFCeU93dk1za0xtODht?=
 =?utf-8?B?Tk1Ja2s5OFNtamkwME8wcVVNR1pUMExDblhzSDR6aXA5Z0VoL0plSVFOd3RV?=
 =?utf-8?B?UTNNTzFWa0lhTWdZcVZMZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC90Y3JzQW93U2tUbVFybGFKZlVJR0xVaWc4S1ErMkVCTnhqUjlWdzNpTlJT?=
 =?utf-8?B?L3ozcWtJbkl2U2dmcHNmL3Nxd3hnS2tNblhveXI4c3o3a2xKMjhzMG5MYUV2?=
 =?utf-8?B?VUdsVTBibTRDUGc2bGZrcXNNcGtQeXZuMzU2V3BqNGpTMHJCNFJTazBIeDA3?=
 =?utf-8?B?bVY0T2VBMnc2VVlLODdzT0NreGJaV21KUyt1SDB4aThsTUE5ZGwyOEQxWWdX?=
 =?utf-8?B?cDZTR1Ezdk9rcS9LakdIR0daOUo5K3FJOE9SR05VMkUzcDZHMnJXSURxWko0?=
 =?utf-8?B?Z3puNHAzOW4vaTE3b3VBdE5OWjgrc1JCQW1CRjR0WXlLbWhUQzRYUjQ5Z0tw?=
 =?utf-8?B?RFhHMFZLa2J1SmxkTk0vZStJUnUvbjlsUUFzS0N0Wk5tSWN3OHhmTDB6WW51?=
 =?utf-8?B?Rmw4eVI2OUNjd1JLYzZNa1Q2L0R2MlpybHp5STM5czdaRGEvbUhpeTJ5Zklp?=
 =?utf-8?B?VWhpcnRMd2ZaZ1hIb0wxNHlMcFJIUHVBeC9JOXhpcEpTQ2RnZ2k1d242YWhr?=
 =?utf-8?B?a1Q0MWdnWGpGWjZNbUllRVl2aEtMcm5MUk8vWklaOG5hVzZVdkxGZFh3TlJm?=
 =?utf-8?B?ZVNWWjh0WlQ5Wk1zK040UXlQWU8zb1l6STlERHlyVVQrU1RDSjRMdnowRDlE?=
 =?utf-8?B?cE5QVzVtMkVwai90bWhpeWNFM2t0S1pwUHdab241Y2R4Y1ZwZ1N0V0ZlM1Iz?=
 =?utf-8?B?SEVGTVdkWFZMc2RBU0ZXVmVoSXBMWndYVGVWZnpDU3M0cEovdzRvT1lZL0tI?=
 =?utf-8?B?REpGdDVkVXp0UEVDMGhaTXNvWnYyZXBUVGdKVDZSNkUrZUZyUHdmQ2hKWDU5?=
 =?utf-8?B?aDM4Nlk4UTJ2Tk5ZWmw4SDNKRzIrYTdrMU1tRWtRelpEZGFwZ0ZPajQzdVJu?=
 =?utf-8?B?UUpjcFZaOEljVFFDS1JVQlBtTVNmQXRuZ2ZWSlR4SUZtWkx0akpuSjArYmo3?=
 =?utf-8?B?L0dEZVhjdDVjMzdUbjZ4bTZaNHRqMFRxc0I3TnJ4cUJyWWljRzU2aitEYVg5?=
 =?utf-8?B?ZDM2bC9nN3JIVVoyQ05aUmpBY2pOaEFMc05BZlZrWU9mRVJEV0pxTE9Ld1JI?=
 =?utf-8?B?MGN2cFRZWXgyemtZbzJtT2ZYWTFPMDh1cmh3S01JUE80eHdrS3dZemYzUTNS?=
 =?utf-8?B?UVJJN1RpcEFKNUovQ0hDVTdOYmdiR3VsS1U5aHA3Y3JrV3FpVU1MQ25yNHEr?=
 =?utf-8?B?cFR3OGJmOHVIdmhFRXFhMDJRZyszNmNoMnlOeVpKWGNaay9SS04zekJIV1gr?=
 =?utf-8?B?NlA1MkhPUEVodnpjUkZuUnp2aFFDU0lrNk9ENDB4Y1dZVktONlQ3c1lpMUlv?=
 =?utf-8?B?ZThUM1pWSUhheHRKVHJOVmRndWxHd3JaTVRqOXdFYnp5RWp3MTRPMmNLSWVI?=
 =?utf-8?B?RG5OZ2c2cVBFUEJsb3hFWkdTWlQxWW4vUEFKUERnNForWlFpVFh2SENtb2Jq?=
 =?utf-8?B?Zm9XNkJTMnhTaWlmS1dWay94MUUvbGRjTDRUUGl6M0hWL0xxZVJveVRpWkQv?=
 =?utf-8?B?UzZqWW0yTERnSmxYQmMxSlpwdnM4NzZISmI5d2J1a1praDNEQk5MbTJ3Wmdx?=
 =?utf-8?B?TE82R3ZvVTFOUGpVQmJvc3FBUVNTbGNEYVd4WlFGWkhoUXo0L1hjaE45TjFn?=
 =?utf-8?B?WFB5OUoySTVSY0VnOXhKRncwYUJ0bjBqMmFrOWFvY2FVVG1QVTBpbGtDcm5W?=
 =?utf-8?B?K3krVkNBRTdaM2VRT0hVV254V0ZFQUJJSG81Vi9sN3BNNkFyZXV5dGtOMHp0?=
 =?utf-8?B?YSt5eFhWYzg0Ti9Xd1dTSFBBYXprcXBEeVp2Yjk0UEQ4MzR1YzIxZE1sMUY1?=
 =?utf-8?B?UElSMXk3RFlyQ24vMWpNSDlWajBjU3l6cnFmNklYMDFsandQMkkwcldOL2ho?=
 =?utf-8?B?RWVnbG9KWUNsM2FlNWRiMzlMbzJLbVBZSVd2N3VLYzlpMVpRekR3akVrSHR5?=
 =?utf-8?B?U0R5UTAybGJyb2cyMXVodnYzck1jQWNEeXUvRGs1bTJGVEVDeW5vdnJTTXNQ?=
 =?utf-8?B?cVB6YzZROWYraDNJWDd0bitiQnlCV2tVdnFnZWMzYUE5UXhMSTgvSlBxZWJi?=
 =?utf-8?B?djF6eG9hOXlBR0lXY1FDL1dadnVmVExZMUdpOG5QOWtTNFpmNWtIREp5MW5D?=
 =?utf-8?B?VGJoQUhiMmcvcHY4YTZRYUR4L1A2dGdMam90NzY0UFRRYWd6SVcwYlpaOFN2?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15954bb-c847-4d32-6458-08dcd22f7474
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:00:44.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiOBoew5I8S/mJoR1wvEbbYo7ig6KABSlMYdnlO87IzYpXh3DACsJpwhaUssGPmZ6sLvAmqhGgNE1qQF/vvQCUmM0j8GNOjSWErcfYpE7CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Now that a RTC driver was added for S32G2/S32G3 SoC, update
the mainainters list for it.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..a6d91101ec43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2686,11 +2686,13 @@ ARM/NXP S32G ARCHITECTURE
 R:	Chester Lin <chester62515@gmail.com>
 R:	Matthias Brugger <mbrugger@suse.com>
 R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R:	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
-- 
2.45.2


