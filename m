Return-Path: <linux-rtc+bounces-6954-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xLtCDSeiT2qflQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6954-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 15:29:11 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECD731930
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Jul 2026 15:29:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HZXyUgE1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W5rqH2SG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6954-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6954-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9518B30053EB
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 13:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FA6283FD9;
	Thu,  9 Jul 2026 13:22:34 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D1F439335
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jul 2026 13:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603354; cv=none; b=lkAPbcaIW+fQPsVgaj1C/wW7C0V9rAHfdZTstPPHoFfImPaakHBzDm/5S1c4POf0lc9/m32cSUDoUeuIP+hHUap9x6uRSMJUQjqpW6Op5Fuuof8J7v8F85ahDiQaChXP2vj+vvILat14+2cqr4bNNypUmn8XVYFYNjZ9UulvFek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603354; c=relaxed/simple;
	bh=HC/c+F4jWg20zvROZJFbcu4k56/NIbt+aeplVr2m0sE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C5r2y5XFmzzDfGpKWhdcq7mP/+lksf93AVANFnjvXBFmvm12Adsi9CYNGY+KpFcx8gp3ltX89pEV7qJ9jFdDfUbnEMzpTWWldqLaSlzRytwR8RMHAfVlt8UruKD9uZqe3tREY45KGih9XgpiB8nGTEQEIefcAKIRgHfuWezVL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZXyUgE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5rqH2SG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNMSR1626137
	for <linux-rtc@vger.kernel.org>; Thu, 9 Jul 2026 13:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=; b=HZXyUgE1qC2tTxRp
	aKFjpzhADqnvoEYITa97oc8yIkKnR+u1JIv4X7kGA/xylW8TlrprK1/2n8gdizjn
	SqH6jPS1A9ReZFi16fvqt33+8ne6u2f/p2fdCB2rCf69CfO4WPiN4AFhWCw4SMEy
	cJsCeKJSH821riMGaTH/p4VLM5HXOpFQ+eVb/sjejyChlxAvmpk4sdu12Vcc6dvF
	gFvgbcnYNwDO6PfzaVWqKHj723a2NHziHTrsWt4uyDE20o2iHI2zRSAgeKtsWPNa
	kcQpyQq1kwEn2+gkIMVOtBitJZjAkvamN9Jg/p3DsQwSblzKleKve345xTfFeE2B
	2sGVjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq34sp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-rtc@vger.kernel.org>; Thu, 09 Jul 2026 13:22:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso16091751cf.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jul 2026 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603352; x=1784208152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=W5rqH2SG00y0TOBcJ/Zhs2706hRXQxlUk3aZdiTs8r52cW77KjojCAApJUPv9PvtZK
         f6C5KZA02QDQ4PSXbebsnIev8n25apKWn+XGPmsSPMwyr19dw2iDoxANn9ofqM2nszT4
         MKJ2c7ekOFUrSXgVLugnaDbahR/zH6GATnQZzRv6Z9+2EsaFkxn0jOCZJ2o3lX29CIMP
         zTYvb6AbCNRsmmVtCdyO6fapIdcj++KXXRtg16st9gZqpvN+BJQcOlgAYNag8m/ME3CI
         M+0O2M0ZDK7t7oXnnWHC0juxfZkweQYA60R5IAjRtNVoswnk3LzGw5m9ciDGqyYKz9H6
         iP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603352; x=1784208152;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=odMJJ/YSUAm83hWPk4iIaqEqwy1gM7mwsYTNzZ5zT+mj6awzUsmoZtMjXKNUR9J+6t
         y8KrILE2FlifkIIXPg/6Uwa9I8T84KFtNnoCShZw5WS3Wi6D0RpjSc9eLr9TX19cbgQJ
         q0AulVXeBw70oZSl6Bo6QxV9DNB3Z9Q5AG8m27vjcnZz5lKuTPPeUN78r05LwkrdK7TO
         dMTyC/USj2TFvGP0pubA/HPeg/XrYuUu1dz4NO9tAQHMNWTazNeTCICFZfLsBur119lp
         gdjw6PblQN6/ZYqvcKH0Js2V0DXBYboWjwCZpBO27SkeLYglnJUW82YLecqkFyzxdt0n
         WC7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9I8euJKIZYnaE2l8Cv2Dew73GNFHAj3aF5UffPbrxtNW5xgze/qdysT+wznTQUrZB9OOPyHMO3sI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYcZzu+dwusb4k/u3eg9gy8eo8yiTYuQ2bmzoMboLkNNOlIunk
	qp+t01Co5APeBwfy5Dp99U/25wx0RYwIp4ouFmaF3I5kQWVtl/kwX7y1kEQxY8trieVxpEkS5a6
	0Fqrbm7ptNZKmXXbpYE+/IBbcLyLWPIZ+A8tAvTzmmkZ/wm3tULwNdviJ1kYV9B0=
X-Gm-Gg: AfdE7ck20GRYLmTDPaR7HrbZdJBJdWke745rkRZ20wSWEiHOVAmKP7V19NzP9Y0LLAp
	/6IJmLYwK4obtlmLoXhhY34dx/+WnnDS+HInvP7gwxDq6v2KukhOjUpFo14uh7ccrsyDFFrPYLd
	A3c2eV0Sw6f27rzgFDbWOcmwG0/WKLiEiQ9G6SXvg/CHqOXtejXHUrK61hl1QV43VmkniToaVmQ
	Or/qev+6HfQr/yZtdGXmQwXwVljUrLBaSm4XqukBqhS9m7abfMV7S5C0rKcQhUIFq8PBv76VuSe
	PBZcWZY3ZeNnC9H07m3/I8+9Db+js9Y9E3+BF+H+tESceRbvuy7M/hzL69vTmw60qz+FTQU8Ea/
	kj/lJfgalYMRlQZq8Svw21XgjoU9fxUO9+UDwyk2gtKeQu5zRIe5CzNTuYxayE4yHeeL2u8I3GY
	otD+/vO/8id0u4Ah19W25ALuuJcuf50fmN39eI8PyW/ooVTD7WEi/GiBavkjtQ188WfMCG5neoe
	s5pXA==
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78889501cf.69.1783603351884;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78888871cf.69.1783603351343;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm388139066b.29.2026.07.09.06.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:22:30 -0700 (PDT)
Message-ID: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:22:29 +0200
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
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
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
Content-Language: en-US, nl
In-Reply-To: <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LpVl4sJknE1y-u_6rYoz5s9vUHhzXF5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX4jqgI+fzHlJU
 oBohKY+kEtNiB1rIK+252+vcVRYsQz9W5rqLfW0WQU8zZ0N36dEtrP12l/QTuEgnsq4Yk2U3N1y
 O5WHUpfh2HOnUBggVyao3waJrlmbalpVNgqRx8of9Zvc1gFV5VJtOnPRKpJQ7exhEfxOoUOt6rC
 boHIBSTljU2qAnitm1/Rs7TvHKk6Zxa2HPJiJdmxJOn34J8NDWyAanJIAnZdFmo4dtB5ofF/6ir
 HZYcHsuRPl19902O9m83CANygiJ8Z06lGpt5MqvS16JTWUEY/qo4U1UmRLBFRjGwSl9g1eS5bg7
 3Cc2oYzA15hjC/YRPliNKI8ep3bkzysX+rSJint0shZxjRSVkNutB5osAnwKqQPumLWmjWi9d5d
 o0VwnEIt7UCyESXQ+AvlSgJ68VRoKXNBtliMY4Ttqkt5T3Hv6FlMT5YCOktiQjvqsbePoTmiMNp
 cp9Om5hIKVOFYhNvxaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX+rspwy51CCRg
 20MRppAZKo+sDw7K7uvjbBpUN9wJS8Tck2W5YzA2v0v0IcBRzV1CAJBpNPcJZj5SIxxA2a6rLNz
 Gg/vqMBiBL599MoTXsx2QFuINRtteP8=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4fa098 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fQniT2RDnAzmI7G1ES4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LpVl4sJknE1y-u_6rYoz5s9vUHhzXF5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-6954-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:sboyd@kernel.org,m:bmasney@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arm.com,kernel.org,baylibre.com,vger.kernel.org,lists.infradead.org,redhat.com,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,analog.com,bootlin.com,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 7CECD731930

Hi,

On 9-Jul-26 12:10, Sudeep Holla wrote:
> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>> modules, but they are then not automatically loaded. Rework the SCMI
>>> device table alias support to make modpost consume the information from
>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>> this information, if known. Also add a protocol-based alias to also
>>> trigger driver loading when only the SCMI protocol id is known.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> So I just gave this a test spin and unfortunately it does not work.
>>
>> The problem with Fedora's kernel-config / setup is that the
>> request_module() from patch 2/2 runs from the initramfs, but
>> the scmi_cpufreq module is only available in the rootfs.
>>
>> It does work if I explictly add the scmi_cpufreq module to
>> the initramfs, then it does get autoloaded.
>>
>> We really need some place to put a uevent sysfs attr which then
>> gets replayed when udev is restarted from the rootfs and then
>> re-reads all the uevent files as part of its coldplug
>> enumeration.
>>
> 
> I don't have much knowledge on uevent to provide any suggestions/help.
> But isn't this a generic requirement ? I mean you could have modules
> install on the rootfs and not all of them are packed in initramfs ?
> Just wondering if that works for other modules, we can examine how
> do they work and what are we missing ?

scmi is special because the actual devices under /sys/bus/scmi/devices
only get created when the module with the driver is loaded because
of some funtion/id mapping requiring info from the driver.

Patch 2/2 tries to work around this by loading all scmi drivers matching
the scmi protocol which is known at bus enumeration time, but this only
works if the actual scmi driver is in the initramfs because this done
through directly calling modprobe() from the kernel which does not
get "replayed" when switching to the real rootfs.

And no /sys/bus/scmi/devices/xxx device means no
/sys/bus/scmi/devices/xxx/modalias nor /sys/bus/scmi/devices/xxx/uevent
which udev uses for coldplug (hotplug event replay) when switching to
the real root.

The cleanest way to fix this from a how things are supposed to work
according to the generic kernel device-model design is to get rid of
the creation of the devices being delayed. Which may mean moving some
static mapping tables from the driver into the scmi core. I'm not
familiar enough with the scmi bus code to be sure.

Regards,

Hans


> 



