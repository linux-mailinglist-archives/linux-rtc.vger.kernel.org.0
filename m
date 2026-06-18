Return-Path: <linux-rtc+bounces-6716-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2GiaHq8WNGq8OAYAu9opvQ
	(envelope-from <linux-rtc+bounces-6716-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 18:02:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3244C6A16DD
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 18:02:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="j+4Ad/TB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bWtzS7iJ;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6716-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6716-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68D1530FBFE9
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 15:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9F731079B;
	Thu, 18 Jun 2026 15:56:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A72F6911
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798205; cv=none; b=IRvuMKTLBHBxfHZPV3EcyooEOQRg/3bK3kQSYEIQc1ZmSpASTqCwX2+9uqKOOuEmuq77XI99I3nTlPLCkEuWkii/x4+jiTdddsGbNSiVLdLXDndXJ8YNfBWmmLsFBZ1tyfu+Pvu/RCDWWMnioI9mHeEnhEuDbRuKVY6iDNWol4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798205; c=relaxed/simple;
	bh=mjHNFjrSpakQHraKQgU4+H6bL9gQu4hB14FwBpqmgUw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FsmTmVst7aNiWdJrX4NJn2mQgkADooluDn3R6wOo7osIP4a6FnBKU9f4ceB16UMJXWVnIwm6j/vttIQN4fgNBwDeruVUvuAC9oMgBxlrOZTj69nvlSUe5NdGdkb2ExxFJ9SP1ESkLdzRYcb00mhhm8BYhqN3yMjakfVlWFkfDhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+4Ad/TB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWtzS7iJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFGCiK1915208
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VcLPpasNEX3QJRIY2M0aIP
	dRTeqR6PucNCShGuq0DT4=; b=j+4Ad/TBxE32rfAqTZbpyHo5FViecn7R35vhpr
	74BEHSF2/qdDmvm+fklFofRMit2uIn8MmjvJl8YgZ6xNgVsThjmZ3BotCkH1eI9/
	louLIg+7SUtah9lg6M0uCp8iZqtFJmlAfKBc7eKX9IpNO1aniohq8rz/FLdjaToH
	q7kBJcoz7BpzIU/SlKHazaORgfwxy/S8vwaDPEh9tr8ApsE73xuAhFNOP+A79pYs
	aeeaKmUMq662gL1I5bm5ogAQ5V2KGJy43PV6w8gdvypO6/lBeIuaHAp4E7ywCsxo
	YnoF/lH5og/tG4XxnDctQi2cLkFhXY389TcmW3IlWx1nC4uw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc3xmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139553dd8acso4460509c88.0
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781798201; x=1782403001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcLPpasNEX3QJRIY2M0aIPdRTeqR6PucNCShGuq0DT4=;
        b=bWtzS7iJBPg6n5tq0TOSnESMpc3T0W2ufYl5B9KuujEnNfbYaQli4ptSgZ0rYBLajr
         BUSiUDWqiF1EII64iNl3cFZKMKeCyvRVfXVZksddCGE+zUA1hy0P9NDWyM7zGie+YIKc
         /bsk1b98YUwbD4uqYOSPb/ldAYnu7eMU2uEuaxXRL4o+NbDaNOqUJ9pTSy1vPG9TbxDo
         6/d6muaqZa4gmCJ8mEGP4RX/ZJp88hdUb0FMFhhWozKmkA74Cs4lrn13tlNKgZOVnk73
         oGgOLJrmMr4S6VMRvb4cuNHhdnm13FlXFDly+i53Slyc7AkAQS65Nre8rRY1TqxbKkpW
         ahzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798201; x=1782403001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcLPpasNEX3QJRIY2M0aIPdRTeqR6PucNCShGuq0DT4=;
        b=cpimw3ZBebRV+qhRq6EdYRXMit7BpbRrROCTXykHD6RuuoD27bo+eFNg87Q2GEE1lu
         JLM1vsc57nKD0cPM3DVC1N3VkMv921kEjxtN6FBiB6l8MMp8ZY4lk97HYHZpwjshi1H+
         cb6bDYa3YUxW89Sn76eWLGYAuGq/4z/G0F+bzOEyEfDcC0sEq1q40xe/R2ymmpzo6KiH
         0H22pDSJfAhuLZBAUNF68axHLh+hGxHPDY6l4EeeusZyvJBIVzbbo+zHAL3jPQShZIae
         xnJDp6wbHqX7cqeNdeBDSLM5MXyBpdRPhK5NRolgpcMjvhKWV3osD6p4camf3aAY1VPS
         hNfA==
X-Forwarded-Encrypted: i=1; AFNElJ/r9M8e8UuROloL01JylxA5HKm9NvN0QW5nYENv/ZgEBbnLYl24qcZst2MlT3ud2lKsdgKTgpSqRXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQmdc+T+qcKAjNAiY0Juf8rsKuQDBwKQd7B6NLnDJgJA1AlXQl
	a3IgFm9eOGkYw2Is87IpYf27VmtlptsFYip02doTaEV/SJZWB/rIKxkwo2zdqwAZgx+swPvXu0b
	P60wp0Y+R6Lxev0ZQKw9JV/CkFSObRDubwOfFdHZvm3/UtAJP0o5XXdsL7H0+noQ=
X-Gm-Gg: AfdE7cnotePlbAt4L0xOu7+2F3o+uHobbSvk25C0io1f4Ok2DwgBShhtiJli2wpC2LR
	ty+Y1GLolGZ5K50gqL/qL+ngoj2HYXAdF4hpeQWSUjnjNInvkHQTOIROUWn0zg69fiMq4bIErmw
	Ytpy70wiC9NGP+FeHbsM07z4ww6ecHa623OYLuzAEMepw3m3YkRmAbySDgRC6UdERCZC8hHik/4
	8KCn1vVjRVG5ljJ/NTOmtYxENhKjiFrKHlSL8BqnsIih/kX4a14NIdF3GThO0txsolMYnBxwUry
	OIEET0fQJZuijYMwjan4A4OHkJkCYLBaihkZWBpWBEgg4q/OMNMkpvFBkBVEdaSPmHrNWCQ7rhw
	9uVGYkeIYiE5N5lHLUK8EaM/oQzriuoe53jRIqi2wSBZRW79TKuge
X-Received: by 2002:a05:7022:624:b0:137:eb21:eafb with SMTP id a92af1059eb24-139a210d950mr184950c88.13.1781798200927;
        Thu, 18 Jun 2026 08:56:40 -0700 (PDT)
X-Received: by 2002:a05:7022:624:b0:137:eb21:eafb with SMTP id a92af1059eb24-139a210d950mr184876c88.13.1781798200388;
        Thu, 18 Jun 2026 08:56:40 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm19671267c88.5.2026.06.18.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:39 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module loading
Date: Thu, 18 Jun 2026 15:56:33 +0000
Message-Id: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADEVNGoC/3WNyw6CMBREf4V0bUl7hca48j8Mi76QayjFXiAaw
 r9bcO1mkpPMnFkZ+YSe2LVYWfILEsYhA5wKZjs9PDxHl5mBACWUVJxsQB6i0z1q4qI9QwXSuKo
 Gljdj8i2+D9+9+THN5unttEv2Roc0xfQ5Dhe59/65F8kFVwrMxbkatIFbJCpfs+5tDKHMwZpt2
 741G+bgwwAAAA==
X-Change-ID: 20260616-scmi-modalias-0f32421bd452
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781798198; l=3732;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=mjHNFjrSpakQHraKQgU4+H6bL9gQu4hB14FwBpqmgUw=;
 b=hBg6Nk9j8qta0n05zkLply061xcL+eKoogc7g6U/ddVe3HybQC8J6n/rGWlCHlG6Rs3u3pXA1
 tTC1mEfs4N3BHALIzXBsVdWzGKEoLUmiZW+sPGVEdal1Zj/Blud0IQn
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a341539 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=8AirrxEcAAAA:8
 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8 a=1XWaLZrsAAAA:8 a=gAnH3GRIAAAA:8
 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=Bhy_3RDnOwLV862tVBkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=IawgGOuG5U0WyFbmm1f5:22 a=cvBusfyB2V15izCimMoJ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=nlm17XC03S6CtCLSeiRr:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: XpAYX8mu3nJuKcr_EcMaLQP5otJibs3Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX/uHkTi5kua9t
 LAcU8BAgDuMtGGpCbVLkdQCHxhTLzriyOHw5j5M/4/SMSh1SsYKAt0abOj1r12mBLP6iKgoRRfs
 tQ+01nOHQHFtWqIYpwCzW7m0tqFrYUY=
X-Proofpoint-ORIG-GUID: XpAYX8mu3nJuKcr_EcMaLQP5otJibs3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX7ZmND1wmkRok
 wMGafFQt2jvFN3MIeJc+yChh9qi3YfZbNJ4dUZzeqf6WnfVkSxxDc9nGxiam3cH8ZBQMaPIOcwm
 HOXjtTck/ugtLN0ws0bS132xmJyOjyNPeUkHnm8lWeyFUpyaUyqwt0y//AN951WG/U8/qtS/6+C
 6zrW8Fd6TBz6NvvwAZLiACTWNhh6zBBuJVZL2zaRElVjOTsMzi+xmLqNgHD1oREzpb4H0MVf3Cq
 Y2VxdPkgXPR59NpGcoFVRjrGKdYjmPm9rrGvuaqgULTFqi38I76YF2qB6uXdIZdEokH7uYWUX1G
 32v2eMfO/bGLKqrnIgZ1Ihq/2VD+d6XQZPe1bOO6uMHa9xt5LYudbDH5vMr4WYber/sWC2GWPAc
 Ho7mhINB3Z95zx8IVJ9WX7OU+d+GBRwGnNG7kyTrfAQAqUznD3fk/SZ+uxbXEiXqkYGR7+qmRg0
 97uo9zUWxCKQ4QuNEng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,kernel.org,redhat.com,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,baylibre.com,analog.com,bootlin.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-6716-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmai
 l.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-rtc@vger.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3244C6A16DD

SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
modules, but they are then not automatically loaded. Rework the SCMI
device table alias support to make modpost consume the information from
MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
this information, if known. Also add a protocol-based alias to also
trigger driver loading when only the SCMI protocol id is known.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Use request_module_nowait()
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com

To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Nicolas Schier <nsc@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jyoti Bhayana <jbhayana@google.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Nuno Sá <nuno.sa@analog.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

---
Bjorn Andersson (2):
      module: add SCMI device table alias support
      firmware: arm_scmi: request modules for discovered protocols

 drivers/clk/clk-scmi.c                         |  1 +
 drivers/cpufreq/scmi-cpufreq.c                 |  1 +
 drivers/firmware/arm_scmi/bus.c                | 20 ++++++++++----------
 drivers/firmware/arm_scmi/driver.c             |  3 +++
 drivers/firmware/arm_scmi/scmi_power_control.c |  1 +
 drivers/firmware/imx/sm-cpu.c                  |  1 +
 drivers/firmware/imx/sm-lmm.c                  |  1 +
 drivers/firmware/imx/sm-misc.c                 |  1 +
 drivers/hwmon/scmi-hwmon.c                     |  1 +
 drivers/iio/common/scmi_sensors/scmi_iio.c     |  1 +
 drivers/input/keyboard/imx-sm-bbm-key.c        |  1 +
 drivers/pmdomain/arm/scmi_perf_domain.c        |  1 +
 drivers/pmdomain/arm/scmi_pm_domain.c          |  1 +
 drivers/powercap/arm_scmi_powercap.c           |  1 +
 drivers/regulator/scmi-regulator.c             |  1 +
 drivers/reset/reset-scmi.c                     |  1 +
 drivers/rtc/rtc-imx-sm-bbm.c                   |  1 +
 include/linux/mod_devicetable.h                | 12 ++++++++++++
 include/linux/scmi_protocol.h                  |  5 +----
 scripts/mod/devicetable-offsets.c              |  4 ++++
 scripts/mod/file2alias.c                       | 13 +++++++++++++
 21 files changed, 58 insertions(+), 14 deletions(-)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-scmi-modalias-0f32421bd452

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


