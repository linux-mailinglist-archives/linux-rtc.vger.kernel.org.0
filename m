Return-Path: <linux-rtc+bounces-6720-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KUyjL91VNGq9VAYAu9opvQ
	(envelope-from <linux-rtc+bounces-6720-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 22:32:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973D6A28C8
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 22:32:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A9i66YWd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cKDgJ9Kr;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6720-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6720-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AB37300A3A4
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 20:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96EF34E745;
	Thu, 18 Jun 2026 20:31:19 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22503343887
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 20:31:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814679; cv=none; b=lP8r1FokLc0WJu3qgW2NUffiDAZpo2QIox6+EH3fbZf0sxUT8HLzWcuuSKNmFw1ANCjo5mAMjcd6DARw9gVuafZYqvLxhbg728Pdy/BdREqs0sAD6VyZOL5WpOC82sbC8W+rYYb1HHINLLucPjaQPz9WGUsT9aNkJ17QRKZSazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814679; c=relaxed/simple;
	bh=HLxQCCXxvKkwoegsbUnC3g4wlzqBB87zcGLg24R2AW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMHfWSRR0JkwmzHglvby1vY6t92Sf0k1TlQAAuOsWXfAL4Dh+nZkLLQtwQ3+N2yBUyt00rgR2EoIWaratCo+euFyISeop4hs5QIExtdrVqH3xKdsYJSpbbLswDGC1sh4j4677qZ5MMPvOP3Ur4auk7KPR7hw+YibjdGprFhKYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9i66YWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKDgJ9Kr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHrjnJ1878939
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 20:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=; b=A9i66YWdpU6YBRKd
	Y/MBdL3leGrrJahi74KTM4KDUukQ+j5qURMvDHv/h26fAMH3YQ7DGji15TAnMGwL
	USEPfEP8AD8iQcYvd1iG1lfmSmz7UW+zAngX+q6y2E0CUnCSI7j/tqtfhJrqkhqe
	Bb7YKc+I5KSThSi349qRKDQodq8XXrVZwF8jlfC8noswCAbuAmfFSXFNt6pILgF2
	eX7GqmBqg+WDX9b4uCvVGCkgfKaMMi1FrJfZJo0n6j3P5s0uMfYxkHKqzunR9kjq
	QH8VKdbeCj2Uku3j8+w1XmjnU3du0rg0dmLmftvJ50lp7ioEz2fD83urICNDRRJs
	2WsO5Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evkvf1689-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 20:31:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-726ff8540e6so671834137.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781814676; x=1782419476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=;
        b=cKDgJ9KrjXfgYkuAz0ahLGqygx6y96tTuM5gD3C6jnlyEPsEzOJG6rZPFM8HnOjgUr
         mUUny6jmwB4C/3MTNm+teD5GdMiZP4WuTn4qqsJ5IwzrdGdmc1LMEd6BrdJug9uYUOH5
         UjwoYLe660iDTEj3y+WbBF7B1rOWE/xxbvbgUh+iJNROoAE4T1ZJDGBbAOWbP0g0TKgS
         TqF2WQuS+7G1kv8+QSLOrPaiarGne3IBo0DlY8/mkZYSMvM0Eu9mMTxPIJznjIbl4ekn
         g6vBVFmRWSKHwZr6T7cU8YN0opsqUwy6g/ine6B3F6pss1S7DEZRDUXbkiD0E2sLaYvZ
         V4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814676; x=1782419476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMV94ArRUWNb5oU3/kS47SDy5ZbaBXLZRnnNKRvZXFA=;
        b=K58AdM5pNnNK85zSwJt0PsOCFnvAir6tSSbWDdfN21tcb9ieSJb073nSUMzu09x7Vo
         YOdEsYF/mPhR53IHEbHNB5076xLz8eGO5JP/qtK5R+Gv2vScSinxln74KV6nuQtKv/Sg
         RyWZpdWByWjwuLLS8BMVW7F4wMEtBLWWTZJp4DqS002IR5V7rRKGpbp/DJL6JlWMLouT
         hHH1rE6Q5FhQfbJmKrNw7EZLN1DKp0ySbPhVOhedd3ZGylqxPe4IIVL3BCayihpiso+Z
         2QrpzQT1zrNUM5t20GCuxTxnDso8SJI0B0d+bIPJZ6WhBa0o18mZcAv7x2+by+VGd/A1
         ZPjw==
X-Forwarded-Encrypted: i=1; AFNElJ+uT0w6mmxBdFTp1/q/xG3otBmLNgeiqIFRd5pUBbAuVMcrehnwc1ajvZaVTryYwcPdDb2LzL2DcPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZcBW7MQxMz6VSKTKRbr2KH/dCz/uKWtD/4gkSA64dUA40vYLc
	9sSpseLItm5lvFjvmFWwTyAuUX5OaaXn+UKYQZxet9tOhhhtoUXm3aH1xY325l2rj/eU6Y12jxi
	T52P67P8q+M7t6XGDbxwCVwYfvbgDjWjSiL0+dMkgzfDT3vSbhKpWpGu+8yEEBUM=
X-Gm-Gg: AfdE7cmGc+gCG5zKwrugQjhnG02WTYImKtxUSwUFPiCol+7NW+k2r4c0BKV5Q5J9pwl
	losHbGUItoyamfg0aru+2D3f/GKo7Y0rqiu+7Bmm/nnJfFBbdeEZlhwCYIpSTWlwr96EqiQroV+
	AmV8SwJqFFtOgJ9SZfo8TvXN1EvW8UYNdisg9VsPycesklJOELv2EED8/LPXppEkF6ohvC9ykW6
	tSRFLunxV2nKhzfEPIqqPAwzD6SpgOSqdcL72skeJpdEutpTdm537pCpDMJugci1uTSITvJhybN
	QB35s3WZ0ic3i0/9JakuE64uopJSpaT8/vBTWTgMzw0Q2hNFsOQ/MirAWx1gh3AZGHidiz7KgK6
	OEvl5lwb0EDkWrvelFdl+m8mcZTDvp/KPRRkyT0Nkbmat/G5EEIiwIQufAfMfMlwK6J81ZldmtQ
	MANcauku7qgPEbMtwWAwCe0A1b9NExxC2DUIpDiL7PrX9YjgHg7LLsvnFwWemvypOvdkxPVMRIR
	4Lt/w==
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-72a01884599mr1095673137.2.1781814676202;
        Thu, 18 Jun 2026 13:31:16 -0700 (PDT)
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-72a01884599mr1095628137.2.1781814675743;
        Thu, 18 Jun 2026 13:31:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490b104sm2351966b.14.2026.06.18.13.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 13:31:14 -0700 (PDT)
Message-ID: <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:31:12 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE4NyBTYWx0ZWRfXx+MEgJS8WoSk
 D617H9qyPdMFTu3D0mgQ0V8q6gsC4pZ9wcSVbINhMsk4VWWNe56pKGDoXB/cWtpTrjLsOjTIDCB
 t2g+Uv6tkF8ByVvL2WrabsIiiykOnRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE4NyBTYWx0ZWRfXzXpLU8QHd7aT
 Rb9S4hj5zrJaBo5G4k7QQO/Ss+wXdQ5WEq42gzP5yb8YX33N8zncSDZme5XPrlDwZ3NZiKlnoBc
 L1XOR2HIwxUDN9+0Kr0wOIXYNGdnS28cvjuY93yR3VqIgV1IrephjjNOPBOXR72UpFNXrbFevjZ
 1xLc0Gby9Ex5zq0HPu0rMRy6DfMa3ZXHabtz7Hdl4FtQ4eF/sL9NclTAas7/Mt+SCtj41gQSRJg
 Kpan2c1NYJlVWjSSo6aRTtIAIeP/snXhp6np8Fw7o7oxERKbNe3Fqd0y8ZMufUB4E0M9L0VqnE3
 PoIkkFDfoYJDY0jYCB7U9O8I33TxYpS7CwAChYv+LCQEYkJgguVmCw7qAfVVj4knOQVQ9cyWdhV
 8MJGzB8ofqXN4t+Skwv1JMPfTlJe22menHEw1xOUvHYH+O+yyoGuFq4+pKjM9Kv4hzu89xQSaAJ
 O8ywaRfoR1NY9I8EIOg==
X-Authority-Analysis: v=2.4 cv=H/3rBeYi c=1 sm=1 tr=0 ts=6a345595 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=IpJZQVW2AAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=8AirrxEcAAAA:8 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=1XWaLZrsAAAA:8 a=gAnH3GRIAAAA:8 a=P-IC7800AAAA:8
 a=JfrnYn6hAAAA:8 a=5KGQkzpS6Bu23flkvY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
 a=nlm17XC03S6CtCLSeiRr:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: mi7DRgbJ3-hdFniUPM3Q8H26U_1i41WS
X-Proofpoint-GUID: mi7DRgbJ3-hdFniUPM3Q8H26U_1i41WS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-6720-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:bmasney@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,kernel.org,redhat.com,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,baylibre.com,analog.com,bootlin.com,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5973D6A28C8

Hi,

On 18-Jun-26 17:56, Bjorn Andersson wrote:
> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> modules, but they are then not automatically loaded. Rework the SCMI
> device table alias support to make modpost consume the information from
> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> this information, if known. Also add a protocol-based alias to also
> trigger driver loading when only the SCMI protocol id is known.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

So I just gave this a test spin and unfortunately it does not work.

The problem with Fedora's kernel-config / setup is that the
request_module() from patch 2/2 runs from the initramfs, but
the scmi_cpufreq module is only available in the rootfs.

It does work if I explictly add the scmi_cpufreq module to
the initramfs, then it does get autoloaded.

We really need some place to put a uevent sysfs attr which then
gets replayed when udev is restarted from the rootfs and then
re-reads all the uevent files as part of its coldplug
enumeration.

I wonder if it is ok for a single uevent file to have
multiple MODALIAS= lines in there.

Regards,

Hans



> ---
> Changes in v2:
> - Use request_module_nowait()
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
> 
> To: Sudeep Holla <sudeep.holla@kernel.org>
> To: Cristian Marussi <cristian.marussi@arm.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Nicolas Schier <nsc@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jyoti Bhayana <jbhayana@google.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: David Lechner <dlechner@baylibre.com>
> Cc: Nuno Sá <nuno.sa@analog.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: arm-scmi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> 
> ---
> Bjorn Andersson (2):
>       module: add SCMI device table alias support
>       firmware: arm_scmi: request modules for discovered protocols
> 
>  drivers/clk/clk-scmi.c                         |  1 +
>  drivers/cpufreq/scmi-cpufreq.c                 |  1 +
>  drivers/firmware/arm_scmi/bus.c                | 20 ++++++++++----------
>  drivers/firmware/arm_scmi/driver.c             |  3 +++
>  drivers/firmware/arm_scmi/scmi_power_control.c |  1 +
>  drivers/firmware/imx/sm-cpu.c                  |  1 +
>  drivers/firmware/imx/sm-lmm.c                  |  1 +
>  drivers/firmware/imx/sm-misc.c                 |  1 +
>  drivers/hwmon/scmi-hwmon.c                     |  1 +
>  drivers/iio/common/scmi_sensors/scmi_iio.c     |  1 +
>  drivers/input/keyboard/imx-sm-bbm-key.c        |  1 +
>  drivers/pmdomain/arm/scmi_perf_domain.c        |  1 +
>  drivers/pmdomain/arm/scmi_pm_domain.c          |  1 +
>  drivers/powercap/arm_scmi_powercap.c           |  1 +
>  drivers/regulator/scmi-regulator.c             |  1 +
>  drivers/reset/reset-scmi.c                     |  1 +
>  drivers/rtc/rtc-imx-sm-bbm.c                   |  1 +
>  include/linux/mod_devicetable.h                | 12 ++++++++++++
>  include/linux/scmi_protocol.h                  |  5 +----
>  scripts/mod/devicetable-offsets.c              |  4 ++++
>  scripts/mod/file2alias.c                       | 13 +++++++++++++
>  21 files changed, 58 insertions(+), 14 deletions(-)
> ---
> base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
> change-id: 20260616-scmi-modalias-0f32421bd452
> 
> Best regards,
> --  
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> 


