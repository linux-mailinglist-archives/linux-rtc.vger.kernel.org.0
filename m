Return-Path: <linux-rtc+bounces-6718-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9sbeDfcWNGrjOAYAu9opvQ
	(envelope-from <linux-rtc+bounces-6718-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 18:04:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B546A1737
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 18:04:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HMEMYtpU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Sse376YP;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6718-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6718-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D51131336F7
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 15:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142C734388E;
	Thu, 18 Jun 2026 15:56:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5F5334C1C
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798210; cv=none; b=TL3IGMW1fjg9ae7Su+aP5EVpb5zemjubh/DKZtNF7mK+g11WvF5hs/7BAYGlDbt6CyUhy1nywJfVJMXvoLl50eOluXTeffNGhfxlLFsZBjEf55o6JjsY6KQ3pgNyyzmGVtlBdUBQrOgftqDLLuJ7ZsnKqRsbfdI8PL8DfhwlHAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798210; c=relaxed/simple;
	bh=ISo22YJnXNXqaVnPUdI2iwKWaaF1NM0ILyuyDS+MJCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDqEy//N0SA54UNVAwab+A4pCTbu1pA+DMLClex6fud/6jBGVBTpZFRpkg0QT+p3P/1Xr4yAr5OYayg3GRulN+d0kaIj9UlA4S1++CX8+gx5k0ZPuYqZz9XgGOw1+rFydxY6jBqOdA81tzjv0VSZnoGMFB31Fy+0JqFwH64V1RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMEMYtpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sse376YP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFGcJl2192159
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=; b=HMEMYtpU19n4fkV1
	DQ37Sr1kDaOTWB/nWmvLonPglOnDbbEK8K+ZHjGmuf1oYnizmR4qzxhH8Um4/xTn
	GzAoy3tPV1X6X7wJjUDx0LRDgXSBr5IfcEf8QStMbGZM/2GQG+S+L1BOXvs5Ze65
	1P+yGX97azGWM6SHP4yR3BgzxcU3EDgXS3b6Q8hjSetrRP5vAmSpWJ3eyRKo0Rkv
	duA+cpOdN4Dqo0oKjtjK/rq2UVuGZHe+LGmfnyg2k4ieWpWxs1ss00sODjm+Sijf
	pHJQW2SiUinz1bpcstciCx3dnKPgWRP9mT453bdZVIreLV0nqJt76xOQ+fe/QjJ9
	AGL4yA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7mdn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1382674ba2eso1919216c88.0
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781798206; x=1782403006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=;
        b=Sse376YPExR+7s0Tz2BAlSM/FPPDm57lP3mbbSccTGGSKMwbYpJ8lJ3P906ymPWko3
         N0oKS1g48w1sRDw0FV3VXYbJqQ+HOJB45hcmS1tyn9pvASNwwMU/zkUUPCL49zTLRgVI
         v5RCiiNjEIreZAc2Y7/Tv6pYcG1SlNyLb+7SjR7IZSfADXYsuB0y9A3bc3BdCE1LLlsJ
         yljdDktIzXyceDIvgLggvs2/qxXQNxkn8kKNJAGSihBswfcTkwVrnY3RYwM9tPUrX4jb
         aXzakm1g9f16tpsjZsTUSxms5N/762MNHh9q6xe00uRKsoDQxkTXwOs5xrmz+tEL8CKi
         T+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798206; x=1782403006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=;
        b=UFtL/aXxn8OkqgBvP2kcG++iXAK4DhTd+4V8iJzGhggwWX/traLP9GB9toL/XhZYr6
         AL5xPayz0ooyT9Wi0M7x1rBaOcQmEUXms9KzR68349GWPuZbkMocWhyqVZcWubQ2jOwg
         Y3cXJeo7W+p/DCnc7nh2s2mNM+TlUALDDHLzgVoDgjXJRFiNTLnKMfzsubh6adBo7Zo7
         o033surAz221OycR0lQPI7JH27ruWr7J7PPdRHbdQkolHGNZsHlCrhKu6tLZfY3zqW13
         KKqrb9o5yl0wW+Km/Km2eilLYZCpXybdvzYVFP2ek1nGeEbJ29waQ11/YmDRTnZZJrs2
         Z1+A==
X-Forwarded-Encrypted: i=1; AFNElJ+OKtnuB67upoDUGyGSI8gL0wByGHUHl6BSElERQVQtPJW88RdxYm1lwON4ciLIiC77vsYOEO/2gUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKbwJdVKYNluPbz6gWuW/Id2fAsDiSDDNBJX6EDAvxyxfqICV
	XwM5Vsbun+HFlV8Pc3m7b9ADQEhD5M24V6UnSXEv74TiPacubf26/mQhOQYTLQtC1eLZHXHdY+I
	D0DuQTHbCM+VS7hMNreBa9N6/ewf/Tdy5R1ZiRKF9T5GJ9drLCzFTlL1sAukEVzY=
X-Gm-Gg: AfdE7cn/Vjw9PRRgpdLKdwxUmp1lesGxKlTur5pKEntZpCnN2kB0LnodnHBBuWM1pbl
	EgqQcgMA/Dh+AuC8dUiMLSSTqKLEo621wMU5pM6izjecFJNt5KcXyBuWd3OdNgW0lVOwXidvwWD
	6SaEYz2/bqjRwi68it4maFA9kCI/nY3njMEfnEXZnh2eR932L0kScP4gccynsWlrtIVKmJZXYnC
	LvNBtf5HnyVcmvIBr95UoEBdneKUHgOJj21TWsTHqB4vwV9BDYR5vcBguOAr4TquRGAn/lAXOL0
	Ib8gXGgxgmz0eDEA9/6eINT2fYvTmFmXp4A3qbNKKXFnbRd4vc47rhIVw8e/LNmtQ0+0Qv/nE/1
	XYTUBif359MQgvpQK50mWL8R+KTMzNy5Z1seyAArkXA6oglvp+ggx
X-Received: by 2002:a05:7022:e0a:b0:137:8bc2:f501 with SMTP id a92af1059eb24-139a20b8f2fmr156808c88.7.1781798205885;
        Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
X-Received: by 2002:a05:7022:e0a:b0:137:8bc2:f501 with SMTP id a92af1059eb24-139a20b8f2fmr156745c88.7.1781798205339;
        Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm19671267c88.5.2026.06.18.08.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:56:35 +0000
Subject: [PATCH v2 2/2] firmware: arm_scmi: request modules for discovered
 protocols
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-scmi-modalias-v2-2-8c7547c1be21@oss.qualcomm.com>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
In-Reply-To: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781798198; l=3118;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=ISo22YJnXNXqaVnPUdI2iwKWaaF1NM0ILyuyDS+MJCk=;
 b=5f2jzig78+7i8GOi9XkZud3yAV6oYQt+ilyEeUyLhW2skjQn50HhCx+V7eK5vQ/uA0ZWG+L0c
 UxiYpJMAspCAqqob00Y6y3CAenu9vXBzFSvBJJIOzsu/L/kkrEbLYzL
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX3iyJOV/8lghD
 OT5jtlctq4kKaw79ZLVSL7hOCz6bieS+HMt6pUu1mYbco2rGuMCTTywg+vNESf6RuK3SZO5T7MV
 p9FO3V+mrAuh/3yx7fVPz6JfDoSqteBfsGYMG7Xti74r1QQqF8znB0grNIQ6IAbwJRkfbz3STPY
 d4FZNQ/1TemjZ4x5LeWbExXbb7xNQwWdsq6sOJjuaDM1TchNnj7kxCWk3sfk+Je7jmoVChg/fRY
 TLVLIUIpCEP9AIkKO3z4IlWksqlnbbiQRviR447kNEOs0KAsf15sXJQIsA95gY8K0LpWU5MdgW+
 Kb7sOS3Lun2Dmvf1zPJmpg1KsoW0/XI6YRgp3C9rOZwRQZcAY0xtpEFeud3KY0vcCwdkDD97BSB
 3oINfFoBO6/i3xhn6Zf2sMFRibUz4QmFAa8C9aeVcz++SKagpKIZkrHSYuY3QDq/4ohRBr5m0iv
 EgtABu1TXEvwqKkQn5g==
X-Proofpoint-GUID: Wq3gPlgRYplZhOkwI-WOWIaoRaomU-JL
X-Proofpoint-ORIG-GUID: Wq3gPlgRYplZhOkwI-WOWIaoRaomU-JL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX5LdGIe0wwnBB
 /WWA1CJ0mip9dU7gDUEIm50tyzTb52uxiWB5uE6dxj+c/DApaZicO8QrpaMLZljaubk57ycxXSS
 QGum9PCSyLpVedwB/1hOYao2FokduZQ=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a34153f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SFLdN7fYUvWWIfk3OzkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	TAGGED_FROM(0.00)[bounces-6718-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmai
 l.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,kernel.org,redhat.com,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,baylibre.com,analog.com,bootlin.com,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-rtc@vger.kernel.org];
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
X-Rspamd-Queue-Id: D8B546A1737

SCMI client devices are created from SCMI driver id tables. If such a
driver is modular, the core does not know the driver's client name until
the module has already loaded, so normal device uevent based autoloading
cannot break the dependency cycle.

Emit a protocol-level alias for each SCMI device id table entry and
request that alias when the SCMI core discovers an implemented protocol.
This loads modules that have registered interest in the protocol; their
normal SCMI driver registration then requests the concrete client device
and the SCMI bus matches it by protocol and name.

This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
only the SCMI Performance protocol node, where the cpufreq client name
is Linux-internal and not available from firmware before loading the
module.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 ++
 include/linux/mod_devicetable.h    | 1 +
 scripts/mod/file2alias.c           | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 0fd6a947499e..7d33fab94e28 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -48,6 +48,7 @@
 #include <trace/events/scmi.h>
 
 #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
+#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
 
 static DEFINE_IDA(scmi_id);
 
@@ -3363,6 +3364,7 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		of_node_get(child);
+		request_module_nowait(SCMI_MODULE_ALIAS_FMT, prot_id);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 769382f2eadd..2cc7e78e35a3 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,6 +477,7 @@ struct rpmsg_device_id {
 
 #define SCMI_NAME_SIZE		32
 #define SCMI_MODULE_PREFIX	"scmi:"
+#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
 
 struct scmi_device_id {
 	__u8 protocol_id;
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a5283f4c8e6f..40a37b6bf1ad 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
-/* Looks like: scmi:NN:S */
+/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
 static void do_scmi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, scmi_device_id, protocol_id);
@@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
 
 	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
 			    protocol_id, *name);
+	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
+			    protocol_id);
 }
 
 /* Looks like: i2c:S */

-- 
2.53.0


