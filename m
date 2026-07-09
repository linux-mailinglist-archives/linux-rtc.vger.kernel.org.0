Return-Path: <linux-rtc+bounces-6958-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VitoEaKyT2rImwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6958-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 16:39:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC687325D9
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 16:39:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=irKXSLf3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q7LqCalP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6958-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6958-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 160683015850
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 14:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EBB3890EE;
	Thu,  9 Jul 2026 14:31:08 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD0377010
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jul 2026 14:31:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607468; cv=none; b=lrWbRwMTsrbQ3/Okr28YLKVXR5YcXttCmi0uYoN9kF8oaFZ2pKFtoVLYVePteoirlbH/JSvU4hRM3OftVXAXzkHbtteK1Gkf1WgutastTjob7xAMAppaQCAv3xhgScsIhv/IkmeXI8nc55R+cXjqt82PQTs6Er1g7dE8HEYlTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607468; c=relaxed/simple;
	bh=i9/EKS5uKSvES1Tz51c9OT6jblP9O4HysVJ1cI/QaN0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UK4vFGFfz+nZCPb6Xr1a+pup3IMTm5NNsL0OJ29cDu4/nVZJxVHAIv8gscxCZx+cn/9rYrVqBTM4k6w3pqYzkkVLeUvs/cR0V9ExNlm5fqRckyWb+/q6Mrxe7tL6kEKR8RHSXxDns7b8/IfQQCj0x3m79huHc2qQKUjLc6moG7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irKXSLf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7LqCalP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DxKYS2016681
	for <linux-rtc@vger.kernel.org>; Thu, 9 Jul 2026 14:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1G7QVGepIEM0CWelKqH3jpucBlcr1CGjsJZXsT1zto=; b=irKXSLf3JBrnMOim
	1gm/OU/wrhtN6T4fsUHL0TBQupKbTUNfWjdpnt5qyWJRrAG51K45kw4XDNhbDe/j
	6Bit7ZV7ZL1FkeN//hoJ/mg9H0xBBAUTScZuc0EkZEP15KSR2gMtfYoTUthvipm7
	MXXIMB9heJvoZIHuo+mcuV7/OCrtMvI9+Ov2LhsY0CQyyQtQGul7BbuM2/Nwzx8k
	cDCmUregGRj8u/LntYKAlJUCbp0fHc7oLEnHuhxwQ3DV6BXvaAJGbRLxfumL4sZF
	7M42umOhaQ3P4DS6RVXkq5F8wnWGYdbVFdU2/5930pMhJs256eA8IYPvCmN8iYQq
	050+hg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6m9nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-rtc@vger.kernel.org>; Thu, 09 Jul 2026 14:31:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73c040cc990so447144137.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jul 2026 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783607464; x=1784212264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1G7QVGepIEM0CWelKqH3jpucBlcr1CGjsJZXsT1zto=;
        b=Q7LqCalPGG8SYmTb5eRH5zqOctPG0qPaBRY7yg8oNgUFJ4g3dE7s/rrvf30Pgv1UXn
         TQ9z8VYAMA5wr2RWkcWnqLHd1kNU9EJG74ifL3aQQMkrjXNRzDa0BT9Pg6IhquSsLcDj
         wSrP4iFKfgUAi85hzDElyb0tfIsCNn0goQAJWvNq7vQkgsylX7Rrlfzf371tRfvk1TNq
         BF2lIfcqbghSX+DlUZ8NW2YmZ2EAI8umf9amhFNsyD3MUtjoFib8nZbCWP0Kor1gT/Ke
         fD2uTxIau+RFPAjJd3RtKU+ZNHhsi5QvUuuv8DWdgNnaXvWACQiHc4q7ODhcjQI35Vuz
         YoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607464; x=1784212264;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1G7QVGepIEM0CWelKqH3jpucBlcr1CGjsJZXsT1zto=;
        b=QTtbt9Wjcsn/+IBI7iy6NROVOBpuKEz0hOxqDyh9ALpL+ZIjR47wjJFIQmTFmSkMeA
         hT3flSjSjDBqqso2rCS0nEeZTPGqZQ4cJVac4b7iPbMru4AdA0o1nN0cKORyVxfXnS0W
         9L9TKnL/jBkxL/8tLkzYjPT+RWN5dpzHWMqvtLHSOh1kSI+hcsti61xKsjgJYB6voxCy
         CfHjY6Bmf9VKCvpJvwt7i5tbEB/+elL12xBmxh37tgLhRid/M/sipheII+NgIBq12Gr8
         w4SDa40Ph5jxHnVW/p3z3y799FrG3utlYmadb5a45F7PxOBRQvNvlp/5/ua8mbd7py0h
         r+zQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUe8/38Pd898BDqmQTWrOc0duOWiI3V1bCOvhQGsvUXbmr6cGadDnnd/8SxNkNMg6nuAjMVElkUjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoQ8XFYacq6eIDpcMyqpX5O5RO1mu+Rt6bHPnCx1eFsZyRIsp
	oskd3/lC7l1U17dFnhFagQEyVExowzu4dvwdu5Q6R4rXY6kVjyvDOU3ZqO/NOP8kVzET1GGnXPg
	eygWJamFza44Zb55Jvbj8txLUsxW+TN2WkV2wLEVAVZEdV1zy0/3zvFA7EYr2m3k=
X-Gm-Gg: AfdE7cnaVrsggh3IywYy7uAVNysw6XIvgYNrglXGGxyC1QV0QPG0sgJtx1p9CmUWGS0
	FaXIbevp8sTAxKJ5U4puShdXFSWjXwDQ12jT5Cbw7KBxJNlgkaSZtvCAq0jEp6ESpqzvXzL+/c0
	fOn6sBdk4ftGQvDPyyTyYmcCX2dod4pO4a/k7fGyeWdryu2DqK5DzzAKYKNUn4x8kWy3qHDdLuC
	XXmCVv6OIfl1PnEyVqHMlAzxxQeVp11cnJod2K8Gzxw8tEc99V9QXyGL/apF/aa7mSpjJjmbEI8
	g21eDkC2/layrQJ7r9yCqQtSP59fRJPljhafb/b8xsHmaChUJaOJcQ19SN3HbUOz44xNcGcqFKh
	jJ1wktZOosI5Y95EtOgoesvFEXNu0C0OsYl7KZLo0Lfmu8SlWE/uWe4PaEpYJitl4zHyYI8hQ+H
	Cz5nw6fxXT5ojcABeyTsrmE8raYmlftXT8k2J51OjYXjpelDmZHsHj9bcg9fxIw2IescOPWMDTB
	PAJug==
X-Received: by 2002:a05:6102:549e:b0:744:cb59:d6e0 with SMTP id ada2fe7eead31-744dfbf6041mr4475531137.0.1783607463720;
        Thu, 09 Jul 2026 07:31:03 -0700 (PDT)
X-Received: by 2002:a05:6102:549e:b0:744:cb59:d6e0 with SMTP id ada2fe7eead31-744dfbf6041mr4475388137.0.1783607462573;
        Thu, 09 Jul 2026 07:31:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm489092666b.0.2026.07.09.07.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:31:01 -0700 (PDT)
Message-ID: <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:31:00 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
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
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0MyBTYWx0ZWRfX6LOqZ+L5+Ldy
 rN3kRcWUJ+fofFQhU9qvdP1m97UJ6t87QxQH2oPyHf8PSHuUE1jSG3yTDE3bTGnjcwf6IxhKKWd
 lScGAAXJ2PNwFTpDHWrPKwCZ9jPsmOE=
X-Proofpoint-GUID: BfG7eB8UqMyF2frzBvKqiNdEBOF1e0Pp
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fb0a8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=1Iq74HBXAAAA:20
 a=EUspDBNiAAAA:8 a=OLQ1oTztZwe7u39PbcAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: BfG7eB8UqMyF2frzBvKqiNdEBOF1e0Pp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0MyBTYWx0ZWRfX6sKTOGBkkLNb
 EtAjTvNXweW1cTkzDcgm7aHdUS0ZYcDIWj2XDrvBcS7W88RaxnO+TrCHpaHwDI31MaQtWxWy4L3
 3pok4g2WTzFkqDSfJxelnD93V0j3nJM84C37I3+zy8eVvPGL1Y3POad2aZa2GYcg7IIkrIi9o/s
 V4rNcTn5EImVL4UR/kt36gtxn7dvvpzOSTKMxaLAr64LOqYGOOUjaoIa9qMEfr8iA4YZ2bKAywl
 q4WGeuVcSz+My4CUY7Mnw7BLrfWcf8T538JfYNNfA/ves7xI1Q7N6EjE0NB8RiEIiy+Z/7WxF1C
 +QPkvgEK6GiDXwot6RlECSwHWXsDBk3x61ZMIfiod4mEoJEOqX5chAP4qZwIRJd3Dvapz2suBWm
 iZdZ9xvnRfHkStySi9l0wc9X8SbF3T21WdSiMTDMxqLdxKW9B1eDT/aYVZlC/51mEQBpShuUm7Q
 /fIg6dqV/u41sBechJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-6958-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:bmasney@redhat.com,m:bjorn.andersson@oss.qualcomm.com,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,oss.qualcomm.com,arm.com,kernel.org,baylibre.com,vger.kernel.org,lists.infradead.org,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,analog.com,bootlin.com,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: ECC687325D9

Hi,

On 9-Jul-26 16:21, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 04:07:17PM +0200, Hans de Goede wrote:
>> Hi Brian,
>>
>> On 9-Jul-26 15:28, Brian Masney wrote:
>>> Hi Hans,
>>>
>>> On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
>>>> On 9-Jul-26 12:10, Sudeep Holla wrote:
>>>>> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>>>>>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>>>>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>>>>>> modules, but they are then not automatically loaded. Rework the SCMI
>>>>>>> device table alias support to make modpost consume the information from
>>>>>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>>>>>> this information, if known. Also add a protocol-based alias to also
>>>>>>> trigger driver loading when only the SCMI protocol id is known.
>>>>>>>
>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>>
>>>>>> So I just gave this a test spin and unfortunately it does not work.
>>>>>>
>>>>>> The problem with Fedora's kernel-config / setup is that the
>>>>>> request_module() from patch 2/2 runs from the initramfs, but
>>>>>> the scmi_cpufreq module is only available in the rootfs.
>>>>>>
>>>>>> It does work if I explictly add the scmi_cpufreq module to
>>>>>> the initramfs, then it does get autoloaded.
>>>>>>
>>>>>> We really need some place to put a uevent sysfs attr which then
>>>>>> gets replayed when udev is restarted from the rootfs and then
>>>>>> re-reads all the uevent files as part of its coldplug
>>>>>> enumeration.
>>>>>>
>>>>>
>>>>> I don't have much knowledge on uevent to provide any suggestions/help.
>>>>> But isn't this a generic requirement ? I mean you could have modules
>>>>> install on the rootfs and not all of them are packed in initramfs ?
>>>>> Just wondering if that works for other modules, we can examine how
>>>>> do they work and what are we missing ?
>>>>
>>>> scmi is special because the actual devices under /sys/bus/scmi/devices
>>>> only get created when the module with the driver is loaded because
>>>> of some funtion/id mapping requiring info from the driver.
>>>>
>>>> Patch 2/2 tries to work around this by loading all scmi drivers matching
>>>> the scmi protocol which is known at bus enumeration time, but this only
>>>> works if the actual scmi driver is in the initramfs because this done
>>>> through directly calling modprobe() from the kernel which does not
>>>> get "replayed" when switching to the real rootfs.
>>>
>>> Should the SCMI drivers be added to the dracut module here?
>>>
>>> https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73
>>>
>>> A few years ago we had to add the interconnect drivers to the list for
>>> Fedora.
>>
>> That would be one solution. I first want to understand the problem better
>> though. The scmi bus not creating the devices until the kmod with the driver
>> has loaded is weird.
> 
> I need to recall why we moved from static list of devices to dynamic.
> One reason I can think right now is the vendor protocols and their drivers
> But in general it was an attempt to help multiple drivers bind to different
> scmi_devices that have same protocol ID. E.g. the performance protocol
> can be used by cpufreq and devfreq/performance genpd drivers.

Note it is ok to have multiple drivers bind to the same modalias,
depending on the reason why there are multiple drivers either one
should detect that it is not compatible and exit probe() with -ENODEV
or there should be some other mechanism to make sure only one driver
loads.

E.g. duplicate USB device-ids happen (they shouldn't but they do) and
then the drivers typically figure out if they are talking to the device
which they were written for, or the other device with the same USB-ids
and then one of the 2 drivers exits with -ENODEV.

>> I wonder if we can just move a small part of the drivers
>> (some mapping table) into the bus code and then just have this work as it
>> does on regular busses. I hope to be able to make some time to look into
>> this soonish.
>>
> 
> I started with that few years ago and we then moved to this dynamic
> device creation. But I agree if it is deviation from the norms(which I
> wasn't aware of at the time), we can remove it.

Looking at the issue this is causing for automatic module loading if we
can get back to the bus enumeration code always creating a device without
waiting for the driver kmod to load then that would be good IMHO.

Regards,

Hans



