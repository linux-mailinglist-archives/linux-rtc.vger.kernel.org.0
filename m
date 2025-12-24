Return-Path: <linux-rtc+bounces-5611-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91488CDB5F0
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 06:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181773010FC2
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 05:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DD1329E5F;
	Wed, 24 Dec 2025 05:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="nFYMNhxp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1122.securemx.jp [210.130.202.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705731E11C;
	Wed, 24 Dec 2025 05:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.158
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766552871; cv=fail; b=MdLbUlmR4WZ13AWjT2eCTYmomKh5O3JWjQpc0oKEm6C8CSmOfZeIjMg9hLLQK1/xeFV4HQYj2QIJRG287mLOW99pwpKvHn+tlvStzU6za+poI8JfBnFwAtaE3pxE1AJO0/sXxvQH86sSoUF/cP71JglhoQmyy//vv29whEtIFHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766552871; c=relaxed/simple;
	bh=IHCiwtPGk3fDCewfkB9172Fz1B+u8N1mJhgWsVBIANo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KH0svayng/ItfPDd9GhOye3n93lsHAM28BuWnnJPqcWAfaTyuryInKF29s9R+A5nwjEbrkQCAhvc5GqXMeapD3HceGKOt26dRdc1y/f4n3tRt15VgOp4sRDzkoYAB26mUPY+5cBJnnv2M8jKiCSwHeS16mFwf9gnBD/tmgvzGcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=nFYMNhxp; arc=fail smtp.client-ip=210.130.202.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key1.smx;t=1766552854;x=1767762454;bh=IHCiwtPGk3fDCewfkB9172Fz1B+u8N1mJhgWs
	VBIANo=;b=nFYMNhxpDdN+RwCPeVfV3gpBE6pe6YI8FPmOC7CkKCpYq7XAxOJRHa9giOfpqyWzLvF
	PR2s0rC0P9JhFtssowQ8Ej0Y8MLVOR+5WHEdYDl9djZt7c4ZcqwYLBH+zdyrapM7jL6sNTOdbB2oz
	ET+9RBt6Ucy2j0cY3EUlxB2v897lFq5WtsmANfooSYWCeDvZCNoZdqY3VgPkasMAhpRr6tpkYkTlG
	TQD4THMXLIL/vyUXPdeSz0FidKgeR0ajSc1aBQ4N5cllvmK9sOWCxFYXyPKmcCTwIXIaAMuVCDadl
	xVR19k9yUEQS+Nwwi2/EsY3iE7djRUTSntnbDBw4/lQw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 5BO57YhI962973; Wed, 24 Dec 2025 14:07:34 +0900
X-Iguazu-Qid: 2rWgRWki9xkJcAMZQu
X-Iguazu-QSIG: v=2; s=0; t=1766552854; q=2rWgRWki9xkJcAMZQu; m=TyeFgHH8sHWunUYuXsMSQSjp5yYXoiK974vDtq6qZwA=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4dbfyG0HK5z1xnf; Wed, 24 Dec 2025 14:07:34 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMw563fv3hOuH4OQj9Qmpurh7n/S1s7Yfp9NJISXWf2dRcRyita53nbKqXjjTjZ6IVUfvSr0XUX325axAaZsY/DeICvajfuk15VgFBC4QzUQACWAFOkoa3p4bkP/DnqStbAl08TgTzihgzcm/6k5NAzEhUhWPyR+sETMrwHXaCdlBgS6T9ci+JzTJDk1mARgv2omdaMsqoOKu2Jwiv6v7k9U/y5qbq6Nd60qQKS+kItGW2Ec41bKHTOSw9cnD7biIYhLZs7+IPsV9RJh0D6gY6s0curcTc/7I0U//L9IQdnYggV6D4f7WsM7sUz2uGiA+dqBT5CPKUaJjn1j1fXc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHCiwtPGk3fDCewfkB9172Fz1B+u8N1mJhgWsVBIANo=;
 b=eqpTpZMGwxJe0FTEbZYK7g9JrXYiMmpFIfOsPazmZrdbQ5jA3L06DP14ownlHUuQ/Th3EVOJ8w+ngZaCB3dRauiKjXcS9GnKMgPfIo1FW8inKZNs6lpLJzRb8Tp6S8RMrH+g3tDNfGt+fenLK7YOQ3ZqWWddef2hWUwnzGs9FsFCrPbkh9q6jwkGoroJZFXCTaZkNaOZH/vi1ceCaycvdtCUHPqzKq5aYXH5n3vQy2qaqsYEsoVWMYv3S+xzKMkk4tfJIb5zJkay2OZos/cfxCigZyrQ4N0kuiiD2OVq2VMdQwgkuOlcGJT39WEukc2cgkEst3AvVry5kQBbc0+D9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <fredrik.m.olsson@axis.com>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: RE: [PATCH 4/4] rtc: ds1307: Add support for reading RX8901CE battery
 VL status
Thread-Topic: [PATCH 4/4] rtc: ds1307: Add support for reading RX8901CE
 battery VL status
Thread-Index: AQHccOCSBP69SG6Ve02ZabckbSpbFbUwRJow
Date: Wed, 24 Dec 2025 05:07:31 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB148180B21D4AC1F4C15AD2F62CDB2A@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-4-b13f346ebe93@axis.com>
In-Reply-To: <20251219-ds1307-rx8901-add-v1-4-b13f346ebe93@axis.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|OSZPR01MB8630:EE_
x-ms-office365-filtering-correlation-id: c7cf9f07-f075-4b6c-c089-08de42aa57cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UjJDYnZlTkRZVDNGc05yOHV4eWVKVklSM0kvWWF6cDc2UHRNUmd5L0tnbU56?=
 =?utf-8?B?STMrYVlFeDRKZHN3Vm4yOEhadGdGajJtd0FmclVxVVMyc3NMWTR1UmY5QWNh?=
 =?utf-8?B?aWVhUlNtdXpRSG43eG5MNXFDRXJJTWZGaGVJOFp2d0wyYStGai96OWdyVFFI?=
 =?utf-8?B?KzNtcEMvdzltRFo3Y2JYOU5GbW9yMWxsNHFjQ1RJWFNnQkYrbkF6anR1Ykht?=
 =?utf-8?B?RHRXTlVDN3JVSFF6VjlOREVWak04eU1KOHdmSDdWOTB5c2JodCtzbVZrT3NO?=
 =?utf-8?B?M3V5em9oTmtoczdDK2cyRDRKd1daa0ZvYmRzYlNFdDNiak45RFY1bzZrbTJW?=
 =?utf-8?B?T1VBNFZNbDNGQm53NlhqcitDSDkrTFRjM29tem15ajJCZWV6bGNVSjFJYVZR?=
 =?utf-8?B?WnFUdnR5TnZlc1Z6MDVSSUY0RHViRWZab2NxRlVLMWNSTENFTjdHeGUwdDNT?=
 =?utf-8?B?c3VmZVN6WmJrcnRFVHdaZDVuK3JodUU1dU81VCtmSnAyMFFoeHVnMUIrbzFV?=
 =?utf-8?B?VmJiSngrMmw0UVNNYW13VjFRVjJIak1uYmNRa21va1EwSy95TVZwS1U5a2t6?=
 =?utf-8?B?T3hPTEI3N01HeXZvRFBHU1R5YzhPU2MrdVM3R1N6U2l0WXc1Wi9Qa1hma0JB?=
 =?utf-8?B?UGpXeVZCUm1zY2h2OVNIdjlTM2hzK1h6OUx3c1kwc2prb204NWVJVjlIU2hi?=
 =?utf-8?B?Y2lzT3dHNlVCUjRNUXlSMEdsUGFqckIrQU9vRDR6MUdOQ1VSL0FTWGZNS3Nt?=
 =?utf-8?B?TXM5VEhveHlmUjRIa3pLd2l0ZnoyK1NzUGJTUElXWFhCWEpiQ083MjdCenc4?=
 =?utf-8?B?eTJwTHJKWDVWNU5rTmhsMVRuZ1daeDlHeThkOGdWcXlwN2FvRHI3SENGR3Iw?=
 =?utf-8?B?OVlHTjlqZ2xvU3pCTzJpTG5mZ1F4MGFKMUF0ZFBBazNSRUg4S2tGNW1ZT2F2?=
 =?utf-8?B?blR5Zm5vY1ovVHdvMW1oSE5wN1NVdEsrMWRlNEVKZGR3cXlFUklNd3lBMzda?=
 =?utf-8?B?Z1hldVUxUHdrT0NlQzJEdFRza2tGc0c0Yk9DL2FwZlQxN1BGZFhLRkg1TnU0?=
 =?utf-8?B?SGFFcnd6bWhGOEE5ZThrUzF3dUpPRnFsT21KSmhsV0VsZlNodnJ5Sjk1aFZo?=
 =?utf-8?B?Nm9lS3VQZm5GRURoaUVNaGRBUG5rNjBoME13Zm5XQjVoWlA5SzBJM3RYN3ZS?=
 =?utf-8?B?Tmc3eldJQkticWRQbkdEWTBJNVlOa1FaZWk5WDU3YlEyODVVSm54REYxQWZq?=
 =?utf-8?B?UXdxTjNwa1RzU1ZpN0pXYTQ2NHVLMCtwOFl6VytqU2RNTXdGdmdObFRzN0xx?=
 =?utf-8?B?MlQwS1ZBalJOcENGTTRNdW9kTFBhSUswekRIQzBCcW9FZmdsWHRKaGtuRXo2?=
 =?utf-8?B?WnRaem15MGRiNTRObTJSdUkzL2tBakhUbTB3cVBDbHl3N3dFZ2NsY3BJSE10?=
 =?utf-8?B?eVpaNXNOVldyT1ozNnlQNDFUaGJsbEw4S3lyWG9CaDJuU2hqcnRQV3BUeEFK?=
 =?utf-8?B?OGdsQzRXUDZBUlAyWmZPajRLR0RUU3lGSVhBR0Y4Y25TSmY4M1pYOWhTaTI0?=
 =?utf-8?B?VEg3dkVWTHBqTXB5S3gvSENjY3pHL3RoSjdmS3lIVG1BMnpvZW01TUc4WWVB?=
 =?utf-8?B?L2dqV0xjSUR1cjhPbU93UFlvVURDM0ZMbnozaVg2RFFPQVgrZmJKSk1FdU93?=
 =?utf-8?B?M250K01Dekp0RjdxaFpWMjJGdGtuSEh0Y3ZJbTI3TDkza0ZuM0lhRHFwb1lp?=
 =?utf-8?B?cDBqaktIdnNBb283VHJ1MEsyQ2dxUjhvVGhtV0lEalhYYktCVTB3L3pLNnVQ?=
 =?utf-8?B?SG1rZDVjQkdWRzFoWlE0b0ZZTFp5Rjh5SUNyaGxaOVNQQ2MyUUNhOEdoRTJl?=
 =?utf-8?B?MlhGb05NS2NWcXpvMGtWbDJyQ3VTUUxJbUVYRE9CTC9BTXdlSFlNMGZQQm9Q?=
 =?utf-8?B?TlBKRi8vWjFjaUNzNVBBeU5Nb0gzQ3M3dUwvY1JCVzcyai9qVzVaVmsvL2lV?=
 =?utf-8?B?bkR2ZERobTV6Nk1TV3FsOUt4SnV0bGxiSUpsZnFWb2FSY3ZWUWhYV2dERm5M?=
 =?utf-8?Q?4ojOeJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OHJEakFwcGdOYmg3dzNUQUZiUU5DcGxJWmo3NFBlWUN3ZmpCRFV6UjVHVDVs?=
 =?utf-8?B?dVJGVnpsTDJoelM0ckxTNmRJZ1FxRzR6cit6TUQ2Vk1EdzN3RWxSdWt4STZ5?=
 =?utf-8?B?Q2lxN0gxTXlGY0twRlVCblQ4WXVUMk5tWUNvRndueHJRd1I0Y2YzMFYrQVlm?=
 =?utf-8?B?S1hGWERJMHZBSVpYY0M2eGVXeFoxd3JmWkk2MkI1M0dzcmlUTzY3SFZZb0pT?=
 =?utf-8?B?aU5kUytmSkxZMUtZYkRXeWRUZW9BbEl3ZTdMMWNxSmJFVE5oSGcxdG5ZRURw?=
 =?utf-8?B?RCtITjRzbUNVTUhuaWZURDUxSkhmRG15TDNvS2xEUEUxVHBKMThiOHN3ajQr?=
 =?utf-8?B?OTZsbmN5bDhIMmFlUkpuSCtlRW11MjFSRHFYMllBWGlTNEE0QU51VUsvSk1x?=
 =?utf-8?B?ckd4UUFSdWdYOHRiOWlrbllBSFMySEJiQlUvZG9CdnI4WUovZFRjMEVWRGla?=
 =?utf-8?B?dlY1SE53c3o5U1I4eG90dXZhcU5NUnVwb0x2Q3BIWGVTaSszMUp1SWh6UFBT?=
 =?utf-8?B?bVJyU1VQZ3NraFNxaWxLT3NRSXVNN2w4ZlREaEhsNnpya1hZL2RtVllyM2Uw?=
 =?utf-8?B?NUhEM3ZmM0JKTXhBU0lzRUN4U2k5Q2NpbXh5ZndUbnZabUpSZktKdmtMeVhY?=
 =?utf-8?B?VG5kWHl3d3lKWDdzcVhjM3Z2VnhrYWZuejBZdGhDVWNDWllocXdCMWZzYTJ3?=
 =?utf-8?B?aVBXb0Z3SmFTWHVxcDBDM3JnRURnWlpEVDJHWFljbUZnOGNOVzRrdUNWWWhR?=
 =?utf-8?B?V21ZRG1oMXV4bUEyR1l0ZzV6dkRjRGFKYktReXFtUkdaNXBObmFhcFJxRVJq?=
 =?utf-8?B?S1Nydm01OXNsT3pQNXNGc2ZHMGhvWGlIWWlwNnBUWTliUGd4b1daaWc5QUww?=
 =?utf-8?B?anpuTTZZWUZDdlBrOTZDUmtram5GcnJUOXIvVVUxbkFzTjJKVzBDeTJVN1Bm?=
 =?utf-8?B?YUF3Z1FCazZaN3A5aDhqOTcwenByZFRuQ2tTN2E0ZGJTMy8vTng4TTRuKzVO?=
 =?utf-8?B?bnJobEE1STlYWmJyTjZnYTk0aUh2Qk9wYlpGb0dJM0NuSitlYXdpOVAvVkp4?=
 =?utf-8?B?N2NaQzExQ1FndkIwM0gzY2pIbEJWWGI3UzdwOXZTUkNNaklnNDZQdEUzelFh?=
 =?utf-8?B?M1duNjNSdlFjUnNGY0poMTBLSDJOUEFnc1FHTGhHTmRMZmFUVThZZUN6MFdo?=
 =?utf-8?B?NVBSYStyUW55SzNsWkhwWnJOcUwyMU9HRzg1bktDbmZOcTdyNzNlRVBoZVg4?=
 =?utf-8?B?bWRtbUdmaTU4dWRhK3NLSHZsRTcwNHY4OHpHckR6NStsSG1iQjBWWVhUbmU2?=
 =?utf-8?B?SHpIZWkwQkpDL3pMWVhwUXQyTFUwdlFQYmxlelh1bTJERjNLTG5FZ2dwdHhR?=
 =?utf-8?B?K0lGTWR4K21iaEIvbDB4cGtUZGpCTHowQ3FGR2psSGlWbGRMMWlIZDA5dzZL?=
 =?utf-8?B?aVJkQSt2MytYL04rTGpKbnpjTmxtQ28vZXRGanVFNGpSVm9Td0IrSlhqeG9q?=
 =?utf-8?B?N1BTZGZXRGZEaGNZYUZBb3JkSWxaMEdEdDlhSE43RWtSRlVHT3RrMW45eURQ?=
 =?utf-8?B?OXlKNU8ybk1Xdm03MHNneEZmekcxOXRXY1BnT2dQOVN4a25naFZjdVc0UHQ2?=
 =?utf-8?B?d2o3ejBhbVU1K0dtd2NUMkpYd0x1aEUwYzMzenF3NU4xUks5YkZ4cXFTcUl2?=
 =?utf-8?B?NFRVUnFvczdBQ0k3VkdoUTFLeUNweXJHS2k4RTE4VDlLRHoxTjhxaEJBZ2l4?=
 =?utf-8?B?dmNOVE9VN0ZnVFFleDQyTjB5ekRhT0I2K2x0ZjQvOGJMcCtyeEkxN2txNjBQ?=
 =?utf-8?B?cEZZb3RXNW14MGZNZFhtYWRhaFBJMU1rTWpQeVgvaWJTKzJHbEh0TllzVlM5?=
 =?utf-8?B?aXErbXBVRklub0J2WmVnK0RzcE9mcEJsRTdsbGx3aGFsMUlqdmRRL1ZyR01z?=
 =?utf-8?B?azVxcHc5Z2R2KzlYN2RXb21iVjlPY3ljdHZSWFZSQjRUeDdOTzUvWVV6V3FZ?=
 =?utf-8?B?ZU5VL25FMEl2enFKOSszeWpZcTVkRE03d3VQbFI0RXVBMTJuWG96TXVnUWZ4?=
 =?utf-8?B?WXpoWGVGNmhhQ1BpTGZ3UnpDYi8yUjRmOUltQmV2YnhnZVZ4RDkyTkZ4d21k?=
 =?utf-8?B?S2JTOUNqWGN6R1BaS1VFUmxmTkJub3dZNjArR3Bpa2xqUndTMnBoZW13d25z?=
 =?utf-8?B?L3hKN1gyTVc2TFdlc3M1OFhlaWExak4xNCtMSWdvYTdXUXVQdk9iN0NjOXl5?=
 =?utf-8?B?QmQ3OWcxRTZ6cklwN29ybDlIajZCQS9pOGhVREdoMXNjaFBnRGdHcldZS0M3?=
 =?utf-8?B?R2U2bUdVcThtR1VJMnZ4WGN5dkZYNUZKU2tFV0pOOWwwajJFOFNuMEZYZEdn?=
 =?utf-8?Q?aoNrtQ75wjwFQcPY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cf9f07-f075-4b6c-c089-08de42aa57cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 05:07:31.7936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vjAavcOequniZ4k3hEqj0tXPI5jDSQzV1pdU/ZPp/Hez0yxQ76+52eHj572QPs+nyfgS9kTBco5GET0ZHD/PuOnNVg/08HLDLsJ8qSZruAls3nyEw0coo93+O4DZ/2S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8630

SGkgRnJlZHJpaywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmVk
cmlrIE0gT2xzc29uIDxmcmVkcmlrLm0ub2xzc29uQGF4aXMuY29tPg0KPiBTZW50OiBGcmlkYXks
IERlY2VtYmVyIDE5LCAyMDI1IDk6MTEgUE0NCj4gVG86IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5v
cmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29s
ZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h
5rSLIOKWoe+8pO+8qe+8tO+8o+KXi++8o++8sO+8tCkNCj4gPG5vYnVoaXJvLml3YW1hdHN1Lng5
MEBtYWlsLnRvc2hpYmE+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRnJl
ZHJpayBNIE9sc3NvbiA8ZnJlZHJpay5tLm9sc3NvbkBheGlzLmNvbT47DQo+IGtlcm5lbEBheGlz
LmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggNC80XSBydGM6IGRzMTMwNzogQWRkIHN1cHBvcnQgZm9y
IHJlYWRpbmcgUlg4OTAxQ0UgYmF0dGVyeQ0KPiBWTCBzdGF0dXMNCj4gDQo+IEFkZHMgc3VwcG9y
dCBmb3I6DQo+IC0gUmVhZGluZyB0aGUgYmF0dGVyeSB2b2x0YWdlIGxvdyBzdGF0dXMgdXNpbmcg
dGhlIFJUQ19WTF9SRUFEIGlvY3RsLA0KPiAgIHdoaWNoIGFsc28gcmVwb3J0cyBpbnZhbGlkIHRp
bWUgaW5mb3JtYXRpb24gaWYgdGhlIFZMRiBmbGFnIGlzIHNldC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEZyZWRyaWsgTSBPbHNzb24gPGZyZWRyaWsubS5vbHNzb25AYXhpcy5jb20+DQoNClJldmll
d2VkLWJ5OiBOb2J1aGlybyBJd2FtYXRzdSA8bm9idWhpcm8uaXdhbWF0c3UueDkwQG1haWwudG9z
aGliYT4NCg0KQmVzdCByZWdhcmRzLA0KICBOb2J1aGlybw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9y
dGMvcnRjLWRzMTMwNy5jIHwgNDYNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWRzMTMwNy5jIGIv
ZHJpdmVycy9ydGMvcnRjLWRzMTMwNy5jIGluZGV4DQo+IDk5ZDk1ZTUyMDEwOC4uY2EwNjJlZDBj
ODY3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZHMxMzA3LmMNCj4gKysrIGIvZHJp
dmVycy9ydGMvcnRjLWRzMTMwNy5jDQo+IEBAIC0xMzMsOCArMTMzLDExIEBAIGVudW0gZHNfdHlw
ZSB7DQo+ICAjZGVmaW5lIFJYODkwMV9SRUdfSU5URgkJCTB4MGUNCj4gICNkZWZpbmUgUlg4OTAx
X1JFR19JTlRGX1ZMRgkJQklUKDEpDQo+ICAjZGVmaW5lIFJYODkwMV9SRUdfUFdTV19DRkcJCTB4
MzcNCj4gKyNkZWZpbmUgUlg4OTAxX1JFR19QV1NXX0NGR19WQkFUTERFVEVOCUJJVCg0KQ0KPiAg
I2RlZmluZSBSWDg5MDFfUkVHX1BXU1dfQ0ZHX0lOSUVOCUJJVCg2KQ0KPiAgI2RlZmluZSBSWDg5
MDFfUkVHX1BXU1dfQ0ZHX0NIR0VOCUJJVCg3KQ0KPiArI2RlZmluZSBSWDg5MDFfUkVHX0JVRl9J
TlRGCQkweDQ2DQo+ICsjZGVmaW5lIFJYODkwMV9SRUdfQlVGX0lOVEZfVkJBVExGCUJJVCgzKQ0K
PiANCj4gICNkZWZpbmUgTUNQNzk0WFhfUkVHX0NPTlRST0wJCTB4MDcNCj4gICMJZGVmaW5lIE1D
UDc5NFhYX0JJVF9BTE0wX0VOCTB4MTANCj4gQEAgLTQ1OCw2ICs0NjEsMzkgQEAgc3RhdGljIGlu
dCBkczEzMDdfc2V0X3RpbWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QNCj4gcnRjX3RpbWUg
KnQpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiArI2lmZGVmIENPTkZJR19SVENfSU5URl9E
RVYNCj4gK3N0YXRpYyBpbnQgcng4OTAxX2lvY3RsKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWdu
ZWQgaW50IGNtZCwgdW5zaWduZWQNCj4gK2xvbmcgYXJnKSB7DQo+ICsJc3RydWN0IGRzMTMwNyAq
ZHMxMzA3ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJdW5zaWduZWQgaW50IHJlZ2ZsYWcs
IHRtcCA9IDA7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwlzd2l0Y2ggKGNtZCkgew0KPiAr
CWNhc2UgUlRDX1ZMX1JFQUQ6DQo+ICsJCXJldCA9IHJlZ21hcF9yZWFkKGRzMTMwNy0+cmVnbWFw
LCBSWDg5MDFfUkVHX0lOVEYsDQo+ICZyZWdmbGFnKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJl
dHVybiByZXQ7DQo+ICsNCj4gKwkJaWYgKHJlZ2ZsYWcgJiBSWDg5MDFfUkVHX0lOVEZfVkxGKQ0K
PiArCQkJdG1wIHw9IFJUQ19WTF9EQVRBX0lOVkFMSUQ7DQo+ICsNCj4gKwkJcmV0ID0gcmVnbWFw
X3JlYWQoZHMxMzA3LT5yZWdtYXAsIFJYODkwMV9SRUdfQlVGX0lOVEYsDQo+ICZyZWdmbGFnKTsN
Cj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsNCj4gKwkJaWYgKHJlZ2ZsYWcg
JiBSWDg5MDFfUkVHX0JVRl9JTlRGX1ZCQVRMRikNCj4gKwkJCXRtcCB8PSBSVENfVkxfQkFDS1VQ
X0xPVzsNCj4gKw0KPiArCQlyZXR1cm4gcHV0X3VzZXIodG1wLCAodW5zaWduZWQgaW50IF9fdXNl
ciAqKWFyZyk7DQo+ICsJZGVmYXVsdDoNCj4gKwkJcmV0dXJuIC1FTk9JT0NUTENNRDsNCj4gKwl9
DQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKyNlbHNlDQo+ICsjZGVmaW5lIHJ4ODkwMV9pb2N0
bCBOVUxMDQo+ICsjZW5kaWYNCj4gKw0KPiAgc3RhdGljIGludCBkczEzMzdfcmVhZF9hbGFybShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfd2thbHJtICp0KSAgew0KPiAgCXN0cnVjdCBk
czEzMDcJCSpkczEzMDcgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gQEAgLTU5OSwxMCArNjM1
LDEzIEBAIHN0YXRpYyB1OCBkb190cmlja2xlX3NldHVwX3J4ODEzMChzdHJ1Y3QgZHMxMzA3DQo+
ICpkczEzMDcsIHUzMiBvaG1zLCBib29sIGRpb2RlKQ0KPiAgCXJldHVybiBzZXR1cDsNCj4gIH0N
Cj4gDQo+IC1zdGF0aWMgdTggZG9fdHJpY2tsZV9zZXR1cF9yeDg5MDEoc3RydWN0IGRzMTMwNyAq
ZHMxMzA3LCB1MzIgb2htcywgYm9vbA0KPiBkaW9kZSkNCj4gK3N0YXRpYyB1OCBkb190cmlja2xl
X3NldHVwX3J4ODkwMShzdHJ1Y3QgZHMxMzA3ICpkczEzMDcsIHUzMiBvaG1zDQo+ICtfX2Fsd2F5
c191bnVzZWQsIGJvb2wgZGlvZGUpDQo+ICB7DQo+IC0JLyogbWFrZSBzdXJlIHRoYXQgdGhlIGJh
Y2t1cCBiYXR0ZXJ5IGlzIGVuYWJsZWQgKi8NCj4gLQl1OCBzZXR1cCA9IFJYODkwMV9SRUdfUFdT
V19DRkdfSU5JRU47DQo+ICsJLyoNCj4gKwkgKiBtYWtlIHN1cmUgdGhhdCB0aGUgYmFja3VwIGJh
dHRlcnkgaXMgZW5hYmxlZCBhbmQgdGhhdCBiYXR0ZXJ5DQo+ICsJICogdm9sdGFnZSBkZXRlY3Rp
b24gaXMgcGVyZm9ybWVkDQo+ICsJICovDQo+ICsJdTggc2V0dXAgPSBSWDg5MDFfUkVHX1BXU1df
Q0ZHX0lOSUVOIHwNCj4gUlg4OTAxX1JFR19QV1NXX0NGR19WQkFUTERFVEVOOw0KPiANCj4gIAlp
ZiAoZGlvZGUpDQo+ICAJCXNldHVwIHw9IFJYODkwMV9SRUdfUFdTV19DRkdfQ0hHRU47DQo+IEBA
IC0xMDA1LDYgKzEwNDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ0Y19jbGFzc19vcHMgcng4
MTMwX3J0Y19vcHMgPQ0KPiB7ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJ0Y19jbGFzc19vcHMgcng4
OTAxX3J0Y19vcHMgPSB7DQo+ICAJLnJlYWRfdGltZSAgICAgID0gZHMxMzA3X2dldF90aW1lLA0K
PiAgCS5zZXRfdGltZSAgICAgICA9IGRzMTMwN19zZXRfdGltZSwNCj4gKwkuaW9jdGwgICAgICAg
ICAgPSByeDg5MDFfaW9jdGwsDQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnRj
X2NsYXNzX29wcyBtY3A3OTR4eF9ydGNfb3BzID0gew0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==


