Return-Path: <linux-rtc+bounces-2845-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D379DA03BC8
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Jan 2025 11:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409DE1885224
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Jan 2025 10:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37671E1A32;
	Tue,  7 Jan 2025 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="e8Ma1Q7D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D921547D2;
	Tue,  7 Jan 2025 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244378; cv=fail; b=XrvgJ5gSUzypK6GtFHbld5c+sosQEXbGXbVFN2pqzSw7qAjNLgMfJ4FCZ4O4RTlB3cEmsNwXJDDqG2sRfcd8i8m7nrtIwvtR22j75CmiqIPe80xFHRcjoskX2+GSLqIGxm0rczsPwaJ7a5itM45SwG6OFau9RtqzE9Q8YZc7XvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244378; c=relaxed/simple;
	bh=mSJ3voEJimMeyNcwHmbH40eMzbhnh7WujUDbTVuED9w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iP2lIfYq5s9adf9dD0S0XNYi8A9cvSMK3vtNRX1FRPunySxLkGtifXP+xk684vuUt2yZ52/q/0fhoTJxIxRzkqdbmhpRLEgOaxJvWBX/RbwGPoI23plzPa+PHtiECWkG13FKOgfXiXWLFjKp51mIjbMaPuL9Vb37E/Gn+RUtM/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=e8Ma1Q7D; arc=fail smtp.client-ip=40.107.20.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2JanpTI3JuP9i53aZP89NEJ6JhexjFnUnfiL6C/ARY5IVgcs8OTEUmd6dc61ZVV+etnuAU5cbb9BL5rQ9PcKUUZ5kq3H+0lvco8egjoRs+5DmZiOc9Q5e/hTsc6pIzHviIZtTp1JMWVNhn1cmSNNyoh1/Vu1a9MzrK3QQjPgIdiO5FHdVNiVLqiFXtSmLP6LMxW9UDigm344Oqrg7oaFHOFt//5iqn99nMjxTdVGAF1YCyk348c990u6giEG8wAFlVcqzA8jIM1dWivTXAQIFXZN5j2StmQaZ7vv5iitF40fBKkEmLs3tAXQ3n15DmdrvDtwx9+ZHgw7iJake2Ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSJ3voEJimMeyNcwHmbH40eMzbhnh7WujUDbTVuED9w=;
 b=FJaV8/reiWZwsgB3l736E1o3TUnzM/8J/AkKdBnHXERunUL+U96txYhnMW1iLCzhOnLz6weMrLdrhOXCbyDDD+Umdw1EVV6thnZyTZVorqP2Qf7OSwLDKxc7O9GwGdb3ToKBpsIqo7OChKJ4Fb0myFaROXnabZS7tL1Mt9k1xT2CVBMRfVbO1PzlNrbdghsxoZD1hKZy6RfKXM0k9yCcr5hOulpoe2R8qdBDNCaDssP00lXtB5oJN+zpxGlqqKMTJUDbHA+zEwAjvMk8AqwRyVjulfLQJkrpKBCO2i6XKS8qhX8D0pCzviUqnGLZOgFjgBwwf7/2V+vXiH9z0hrp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSJ3voEJimMeyNcwHmbH40eMzbhnh7WujUDbTVuED9w=;
 b=e8Ma1Q7DGAU32jj5mWJGssWNDoqimURM2AiNFs773ghDSJuYZ/ztNgvEURnacUlTdlfKrOKowH14cctb4AfpHeoGgVAj2+63K5OLkCPu1Wr/GjkIgzJKZb1fAA8EvcT/RjTQ3XP2802U8ATWlmIKFeqwbwo8e3uCgsHDU4oY6JdDquAoOHxIUB07k5Bn8cLOawzzkmIq3aq0xcTUNvhe1zeXi/BR8cpDM53evMMjDk29LSWWpd+7BHf6idmmMcVv+LVuSdOLsizO29mS9Gu0Yoaz1XTSrMNfvx6zN9sGE18cRI8AxfFUonchPsA6WVk5En7YC4YlP0ZeUAL8JYQeCQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB6176.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 10:06:12 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%4]) with mapi id 15.20.8335.007; Tue, 7 Jan 2025
 10:06:11 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "Stockmann, Lukas" <lukas.stockmann@siemens.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: pcf85063: do a SW reset after rtc power fail
Thread-Topic: [PATCH] rtc: pcf85063: do a SW reset after rtc power fail
Thread-Index: AQHaaX8AVt2JFt0PzEGKX0717h7j8LEh5IgAgADaiQCB6kV/gA==
Date: Tue, 7 Jan 2025 10:06:11 +0000
Message-ID: <9e12863cf7ec0284b632226c31403d740dd32350.camel@siemens.com>
References: <20240227131436.3342807-1-alexander.sverdlin@siemens.com>
	 <2024022922080217cbe165@mail.local>
	 <f882d7964d2d905288bcb7d01421b5eb5bd1b6f2.camel@siemens.com>
In-Reply-To: <f882d7964d2d905288bcb7d01421b5eb5bd1b6f2.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB6176:EE_
x-ms-office365-filtering-correlation-id: 45ec0ad2-007a-4245-1d07-08dd2f02ea05
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Qi9BcXhMeWZFS1Z1M0ZzYU00NE5sYWRsLzFJNVI1MGtVajhVTnVzR2pKQjk5?=
 =?utf-8?B?Q2dXTkdsV1hGcjRXVUwyUGl5cC9RNUp4OC8xM1RPNGt0SnVyRXNCZEE4blEz?=
 =?utf-8?B?ZHRNRit5RXNNQjJBTm1KeEc3R2NnUDkyc2ZidTFEK3NPMmtFSXZ5WGxJQzRE?=
 =?utf-8?B?MVFkdUJ6cWdmV1U5N2tYanBFTXBRTTlObWFac1huUDdlaXIrQTZWNmFEWndx?=
 =?utf-8?B?ZkVCbEFFbm9UZEEwQVd6TytqRVhIcEozQUZOeDNhd1h4S0cydy91SXh2anNN?=
 =?utf-8?B?dEdjVzZYTndCcGhhOWdacjVMZ050eUM2M3RyZHhGMHVPbWQreVVGckIrT05Y?=
 =?utf-8?B?YWlaSG1NeDc1Q3lpK3k3eS9Ub1I2RVk2Snl0UmRVcFcrbWh4MXBZYmZjR094?=
 =?utf-8?B?TEo3dERFcSt6eThBVmx1WUQ1TW9vSFlkVGZ0Zjg0ZUhjd21aZWhOZVVpUmRp?=
 =?utf-8?B?QlRFYkdMVnZOcWtoZjh5cUdwUldQSkFnLyt5cVA4QUxLQ1RrMWtLcytFVmxE?=
 =?utf-8?B?cHJvZUZ5a2FGelJTMFA5RVZLRXFUYnhKZE53OW5kSHNmQ1c3N3lNSGxqTTFv?=
 =?utf-8?B?Tmp0U2hPbzA5dDVlQjViaVBqSjh3eEJ0N0MxL1djOTIxUkNsR2xveGVrRHVo?=
 =?utf-8?B?RHZLUFNJN0VwVEpzNWx3UmJtVnAzN0tYUjJJMnIrcUFpVXA1UWVNV2xhd3N6?=
 =?utf-8?B?emRHQXlrYnZGcEkzZm9BZE85VExlUGZFM2xOSWpBMzhFclZIZnBJd2puVnZm?=
 =?utf-8?B?QzBTenBXbzhkT0ZXd1YycHE4WTY5NmJFMS9HandlQ2RXeXBlUGQvYU9SNXNU?=
 =?utf-8?B?Y2g1ZGdkQ2xqUUpzTG5kRzdYTW5ZTElDUFFCUkxzMHRjTy9XbkpCNzdOM2hS?=
 =?utf-8?B?bUZlcHpIbzlhZHBrYlNFMlJtM3RqZ0t4WXJxT0ZqVkZyWkFJUHdMc1lHb2Np?=
 =?utf-8?B?cGY3MTFOZmtHaTJ4VU5oMXBMMWV1bGFwQ2dOY1ZtZjYwQVRQUVBYWStMa1E4?=
 =?utf-8?B?WUhranR0ZUh2clpLQUVWRWp5MERoSzNtQWRKaEs1TFAwZE11TFJvNCtYN1pN?=
 =?utf-8?B?eUZCWGRJRGY0RFRMRTMrbGg1YlNSa1R6aGRNNG9kUjV6REtwd1VJSlY2cllB?=
 =?utf-8?B?cVFralh3eDhERWZoT1JpdFBEa3Y4TkJQOWpHQlMwNHdpVndhMjZ5Nm4rVjVI?=
 =?utf-8?B?TStaVEJZMjNhZ2IvdU1XMElYaWpNYmpMNFp0ZXEwY3prdXBJbXpZRG1WWjZk?=
 =?utf-8?B?OVlIeTFoanVUQTlCQWxkZVdpQVVBUGo2eWlHN3BlRHBzeTNFQlpScTZYUUgw?=
 =?utf-8?B?WUYvSVlKdkRJajZTU2dGMnY0Skg2VkVXcjExOVBMb2VSUzR3YUxLaHR4Z29r?=
 =?utf-8?B?aXQzRG9zR29qM3ZRTmNiSnhWNnJCS3dtSlF3Rm9BbmhCQVMwWmZVVHNEdGRB?=
 =?utf-8?B?bnc1VVRaK1pwcGlDVjFiM2xSYUhEN1NoOG9PeU8yd2tMUGF6KzFxeUFzbUNo?=
 =?utf-8?B?cTVuMCtoTVVPakR1NGZPdHJSQlQ2WGkxVDZhaGtTbGluOGs5eFEyVXZtRUtT?=
 =?utf-8?B?U2JpTnJqTVJNU25EcWZXblp4VEsrL3Jtalpock14UkY3eFN4WC9LUjlkOStY?=
 =?utf-8?B?NWxaTTU4SmFhWTdDeVpOTG9jYWtocFY5K2cwV0xRc2RpdC9idE1uTi9nNEU1?=
 =?utf-8?B?YmNCejZWRDkwZDA4ZUJ1QjJVcUZRZXJUbnFIR29UOUNQL0hUVXB1MkpKTXN4?=
 =?utf-8?B?am1GVjJjbmhncFpIS2JzOHBHVjdnNXhTcVl3N25nd0dvc3BrU1JrQVNUYVE4?=
 =?utf-8?B?aVA1ZmJTc20yWVNpQ3ZJdm5JZGdGRWt6OSswQ3NaTUoyTHVBZ25oMHU2cHlY?=
 =?utf-8?Q?m7ZFCF8B3CUM+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2xvS1oyQVFyVTBkeEQybmNGUm1kK01sMmxhTFNyVnRORWxYMjQrMmR5MWNJ?=
 =?utf-8?B?bWpFVVNoWGlwNGJYUTliL2pyUWdiTnZyWm5YLzhlZjA4MkpVOGlXTHVXbVhP?=
 =?utf-8?B?L3FadlZIZU84dklmeHMybTh5Rm5QNGNEQjlWajFMbW1PaVY5SWM4MUp0U3VK?=
 =?utf-8?B?Rm9LN1V5YXQxZnRNUjFmbTB6bEczSE45YzBiNC9wQk9aV09Sb1ZwOUY2Z2d1?=
 =?utf-8?B?cTY4c2lmbXRmeW9MbEtjZTV3VU1odnoxWFZ2QWVFWUlWOEZKcUx5QnhqazFI?=
 =?utf-8?B?OUVLaHdCMU9hSUJwQzh3NUFGaUJxYWhaSk1FUHNITG9iM2o5K2ZPNktFd1ZJ?=
 =?utf-8?B?NDBVVXVqcDVsSU9oTUxHRTlENFd4TUtsSWczUVdFanQrbndTZUpNWitGcnRC?=
 =?utf-8?B?S2s4T0gxS0ZSQUFuL014ZTNSd1F0Z0NhWWQxRmVrQUE2OHhKMEhUQThTWGgw?=
 =?utf-8?B?ZVRhSys1S0o5SmJxajlvWlc2QVFkbTRWTXA2ZVJBb1Y3VXFMaFJtNnZOVXpl?=
 =?utf-8?B?eWk1M3RWZjk4dTFSWG92b2k4TlNqN2FCME00NEFNaXZHZ3UyZWRnK0NSZHVI?=
 =?utf-8?B?MjRUaFU1RnNsQjRheVkya0ZxM2w0azZ2SkhQUjlaSUo4Vkc1WENYQ05GZXo1?=
 =?utf-8?B?V2JoeFpmeUtSbmZBanNldVRtZG51T2xob0lYVE9vK1pBL1JTNFBZYU00QmEr?=
 =?utf-8?B?R0g1Zkt4VjBkeTU0QldxdjlKWWRrdUlNeTVoS2ZvREZzanRISkdVOXl1dG9J?=
 =?utf-8?B?NG9wSmxEMFdoVFZ3RmZTNW1lT3g5VCtEbk8yQWJzKzgzRWJIc0JlQ1dCUHh1?=
 =?utf-8?B?aXZiSlFBSC9WYVIrSjVhbGoveHd3bjhEYXBkWTNLQVVQcHlTQ1lPZkZWYUdu?=
 =?utf-8?B?NmZnNWpNNUxIUlVqYTh0NVdJODZGbXl6a1VLd2ZUL0pNUzdiV1ZKcVJtOG9N?=
 =?utf-8?B?TzJvRjZ3VUJ1MTFHMjQ0U2RJT1lHVk5pbVU3RzVsRVpWd3c4a3NaWERTQ2M5?=
 =?utf-8?B?K3ZJZkFLT3N6WUJuQTdsSktVZDNMSERVTm0wQUcydEdPeThCT01QRTVhN1lI?=
 =?utf-8?B?OXNiTE5UN0JaRXpzb2hOekJMQnJyNlBwSVIzaGgwajB5TXZaVTMwbkczQUF2?=
 =?utf-8?B?QllZOHFUT1FHQjNwMElPMGdGUDNQVnhOQnNFMTZPM0hrZTNHTnBOcTU1N2pX?=
 =?utf-8?B?OHNPTnFMNW1kMjYyWXptYTlsY0pvbFJnOGJHT0VPZ3hDU2h5b3cyajhjVnpN?=
 =?utf-8?B?RW1pODRxeEgxRlNKU3M3OFNMdlNNYytyelhpTWJpZWZtcCtPb0Z0RnJDZEFa?=
 =?utf-8?B?K3RPaTM5TEZNblZDTWhmMzFQZWpHQmJZdUQ3RU1PRDdyc3g3c0FPUU4wUXpm?=
 =?utf-8?B?TThaYzRUdlhqWE5QYkVoT3FhY2pBZHZxazk0L0ZHaU5zbUhldGFUMDYrMFFv?=
 =?utf-8?B?L1hxYnIrZ0ZHUDhwK1JtZTBJcWVkWUVnMUZIeERhSnBvSUNaZEVla1hUTFNU?=
 =?utf-8?B?amtJWlRGR1kvcWpxMEZRc09TTVcvNHRMSGJMOUhxNmtVblFqbjdqRUtQalg3?=
 =?utf-8?B?VnBsOWtiVFI5QlQ0cjZrbUFWM1VWcVFBaXNZYVVpR2Z4SVA2bEtFRllwZ04w?=
 =?utf-8?B?Z2N4eFFaOEJmU0Njb3QwRXJML0ZmL1k0L3VuakZ2Y3VVdS9yN3I2SFkxOTRO?=
 =?utf-8?B?c2ZYRkZrbW4wOUpMRzYwbmFWVkJZUEMwS2NUTG9WNmRIZ0VRdUZEMmFtcCtF?=
 =?utf-8?B?ZDZoeWxOM0VtMktOQUVjZ2kyYXJzZjQrY2szNWFhaUQxYTlTUU5NZWJ4VmhQ?=
 =?utf-8?B?YThwSFB5SmF1ZjFIWjU2WUFIUnFqRFBlSTFycW56VFBxUHhoc2ZsbmE0d1d2?=
 =?utf-8?B?SEk3eFF3eE4vaHRnZDAzak9POGtkYnhSOXN3SlNYczNjalNENDIrRWI0NVZy?=
 =?utf-8?B?TUIrQzloYU12d3NtSkErdnRnZlhXcFpZUEhzaWY3WE9jR3UxczFlRE9SMUJX?=
 =?utf-8?B?cVJPSDN5OTlsUEtBRDRIcFdJQlhsalg1MUJibW5WT2ZMZ1QvRmVoT3I1WlNx?=
 =?utf-8?B?SjI2Q3hsK0lMMVZ6UTArTlgzdWRWMnIvYlEyS0tUVU52VVl5dVc1RGtmUkM2?=
 =?utf-8?B?VlRKQmFQVVFCSThVdzFtcU1lMDJSQ3I5QWN1YjJjcklQemkwb3Nic21jTXVm?=
 =?utf-8?Q?zhL3PH2rcA5jwbni4swgbD0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB3139B7F702C140AA2B4908DDBB8C6D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ec0ad2-007a-4245-1d07-08dd2f02ea05
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 10:06:11.9090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pslae8vpb52y5Pz92aaPMTUBqEioiNNsbHLA15mThF2Y1w0NT7l5l0ZQz9QuR0ATjXPeMAiZAu55jdN2R2vOiWkAFHxp4GtttNGGJwHJOJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6176

SGVsbG8gQWxleGFuZHJlIQ0KDQpPbiBGcmksIDIwMjQtMDMtMDEgYXQgMTI6MTAgKzAxMDAsIEFs
ZXhhbmRlciBTdmVyZGxpbiB3cm90ZToNCj4gVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCj4g
DQo+IE9uIFRodSwgMjAyNC0wMi0yOSBhdCAyMzowOCArMDEwMCwgQWxleGFuZHJlIEJlbGxvbmkg
d3JvdGU6DQo+ID4gPiAiVGhlcmUgaXMgYSBsb3cgcHJvYmFiaWxpdHkgdGhhdCBzb21lIGRldmlj
ZXMgd2lsbCBoYXZlIGNvcnJ1cHRpb24gb2YgdGhlDQo+ID4gPiByZWdpc3RlcnMgYWZ0ZXIgdGhl
IGF1dG9tYXRpYyBwb3dlci1vbiByZXNldCBpZiB0aGUgZGV2aWNlIGlzIHBvd2VyZWQgdXANCj4g
PiA+IHdpdGggYSByZXNpZHVhbCBWREQgbGV2ZWwuIEl0IGlzIHJlcXVpcmVkIHRoYXQgdGhlIFZE
RCBzdGFydHMgYXQgemVybyB2b2x0cw0KPiANCj4gLi4uDQo+IA0KPiA+IERvaW5nIHRoaXMgaW4g
cHJvYmUgaXMgcHV0dGluZyBhIGJhbmQtYWlkIG9uIGEgd29vZGVuIGxlZyBhcyB5b3UgYXJlIG5v
dA0KPiA+IGd1YXJhbnRlZWQgeW91IHdpbGwgaGF2ZSBhIHByb2JlIHRvIGNhdGNoIHRoaXMgY2Fz
ZS4gVGhpcyBzaG91bGQgYmUNCj4gPiByYXRoZXIgZG9uZSBpbiBwY2Y4NTA2M19ydGNfc2V0X3Rp
bWUgYnV0IGl0IGNvbWVzIHdpdGggaXRzIG93biBzZXQgb2YNCj4gDQo+IEFzIEkgcmVhZCB0aGUg
ZGF0YXNoZWV0IChxdW90ZWQgYWJvdmUpIHRoZSBkZXZpY2UgaGFzICJwZWN1bGlhcml0aWVzIiBp
bg0KPiBQb3dlci1Pbi1SZXNldCBpbXBsZW1lbnRhdGlvbiwgbmFtZWx5IGl0J3Mgbm90IGFsd2F5
cyBkZXRlY3RlZC4gSW4gb3VyDQo+IGFwcGxpY2F0aW9ucyAoYW5kIHByb2JhYmx5IG1vc3Qgb3Ro
ZXIgZGVzaWducykgaXQncyB0aGUgc3RhcnR1cCBvZiBMaW51eA0KPiB3aXRoIGRyaXZlciBwcm9i
ZSwgd2hpY2ggaW1tZWRpYXRlbHkgZm9sbG93cyB0aGUgUG93ZXItT24gZXZlbnQNCj4gKHdoaWNo
IGhhZCBzb21lIHJlc2lkdWUgdm9sdGFnZSBiZWNhdXNlIG9mIGxhcmdlIGNhcGFjaXRvcnMsIHdo
YXRzb2V2ZXIpLg0KPiANCj4gSXQgaXMgYW4gaXNzdWUgd2UgcmVhbGx5IG9ic2VydmVkIGFuZCBz
b2x2ZWQgaW4gMTAwJSBjYXNlcyBmb3Igb3VyIGRlc2lnbi4NCj4gSSBqdXN0IHRob3VnaHQgaXQg
bWlnaHQgYmUgdXNlZnVsIGZvciBvdGhlcnMgYmVjYXVzZSBpdCdzIGFsc28gZG9jdW1lbnRlZA0K
PiBieSBOWFAuIE1heWJlIG5vdCBhcyBzZXBhcmF0ZSBlcnJhdGEgZG9jdW1lbnQgYW5kIGl0J3Mg
YSBiaXQgaGlkZGVuIGluDQo+IGRhdGFzaGVldCBidXQgSSdkIHVsdGltYXRlbHkgY29uc2lkZXIg
aXQgYSBQT1IgZXJyYXRhLg0KDQpUaGUgcGF0Y2ggaXMgbm90IGFkZHJlc3NpbmcgcG9zc2libGUg
cnVuLXRpbWUgcG93ZXIgbG9zcywgYnV0IHJhdGhlcg0KYW4gaXNzdWUgd2l0aCBQb1IgZnVuY3Rp
b24sIGRvY3VtZW50ZWQgYnkgdGhlIHZlbmRvci4gRG8geW91IHN0aWxsIGhhdmUNCnNvbWUgZG91
YnRzIHJlZ2FyZGluZyB0aGUgZXhwbGFuYXRpb24gYWJvdmU/DQoNCkZvciB0aGUgUG9SIGlzc3Vl
IHBsYWNpbmcgdGhlIHdvcmthcm91bmQgaW50byBwcm9iZSBmdW5jdGlvbiBzZWVtcyB0bw0KYmUg
ZmluZSwgSU1PLiBDb3VsZCB5b3UgcGxlYXNlIHJlLWNvbnNpZGVyIHRoZSBwYXRjaD8NCg0KLS0g
DQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

