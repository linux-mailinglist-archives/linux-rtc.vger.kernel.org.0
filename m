Return-Path: <linux-rtc+bounces-6717-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tmo0EdgWNGrTOAYAu9opvQ
	(envelope-from <linux-rtc+bounces-6717-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 18:03:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7076A171A
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 18:03:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O24Gebbh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cQkhg4cr;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6717-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6717-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2395A311EE40
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2026 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677FA33E35C;
	Thu, 18 Jun 2026 15:56:49 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF12DFA25
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798208; cv=none; b=AESjUgEXmE/LxQ+wLJjoFL4krHM8JBHZMZ9l8lzPbFN4KA1mzNU7BCqbEBisbWmsmHQDX7y/p97+TDDlYRWenMZvAXRGH6pK0YKZIyiOz/DJOl21yqCLApnnKBG+iSpfJ5MPFRt8GHywJN204IstUHQvNYYmB5lyb2GA4ACqJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798208; c=relaxed/simple;
	bh=0HZrOmJ+qQqa0s+dcFvL72a0kqPu07eI6PGHZlEPDpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3Jsc66hUHlihZh04JWSSDvEnlLJ24OKh7yDoKqWZYcXHYx+zJwWO5U5iAj+1lQ7/TSO5O5i2oiBSwA4jxljwF3cSPvD3meb4O3M0PTuZTuSOlxzb6zUyR7PfdqTid7nDILRHF34M9tYI5+Ugia/rOs4KQo/tjINOsAoEaw83/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O24Gebbh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQkhg4cr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFGto21953218
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9s2Bv715DLhBumD6HY6OSEbVyzo+ciktNGTEA5rRus=; b=O24GebbhNMeaZNdf
	NfQZeYyoTVWvoIJAxylq5zjnCbzQxIPa8ip5HJpq63GhhzHPx5Dde1S0F/STPkyw
	B83VPKTFDxQc0nIhvhnwB1yme4WeuIdH58fKl1vRJi67chwEMk6aprjqfBvrP+8C
	Q8JbPWGIB0ak+ykq7XnV8F6cxpAmE0FXCP9Sxuj8enSFNZeejLmW4qGLivh6Sfnw
	1m7ZVEKmOueeze/5HMbAhB9RDM+WtUoQul59pt+jkqiPL17tj1RhhwHpIlhF+FYp
	VgIWK37qQWkHL7ViYCiEtp+gzdk9th/fRadqN+vEJUDi8dmn/ayTV8uyQXCJUDwX
	TeAb9A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtv0wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 15:56:45 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-138156c0492so3984342c88.1
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781798204; x=1782403004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9s2Bv715DLhBumD6HY6OSEbVyzo+ciktNGTEA5rRus=;
        b=cQkhg4crLcDPS2fdLgtw2GJPM8DpQbF2t3VTikQr6ZlmAj7Z8dw8mJuuIQ5dtd5kUn
         U5m9KTaS9c9UiUnBrXHBI+c0r0Tb517S10g3keKzFX/vxSJBmqfRD/TC0RY88uZxs8zk
         5FqGASHg/sP833qDcIGWL78PcV14NxYH5042Q5+biFsfiMVVfXOp9Ee1ZcIxMAPo7VIJ
         MO6TgmHTMB05+47j5MilN/rPqLMKBJ1SEPAEBzibOfabzHg4fg4F+vBL7kuxvaDrQfCe
         EFXERewYeon/DVHsfSMvwx7D/ULwg0ymInBJDAMH4u6uLvebEDPvA6L3Sb0lLgByaSzB
         /dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798204; x=1782403004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9s2Bv715DLhBumD6HY6OSEbVyzo+ciktNGTEA5rRus=;
        b=XJ3nkQFiNG2wX1JWAERD0Vntzna22BxtYl78sJNeZTER2mZec5lOlNM/hreN3LOZk5
         7m1N1v+17lw6wPvex7JcGyxp6V/0p4TypIboT1FMI1+PLG/6xZdr4RrQ7SZwPziWrpV3
         8mdpX7gHHZV8qAxQhzNw6IcZf5sTRMTLW8N1XG2hnzB3fYRl+Pw8YKDsh5kayzXAuPun
         TADIxY8UAO+7FpyFbz8xNYAt/mmjzCudfozS0+N1S8JFtn+AxytKw6Q9B9yb7xKRlqaa
         Rodo/io3T5YkRWEsLCfkLio2VGpPAD5GabcYzEAb+D/uzKzxHMANIOZW6vOrQtypB0Lj
         6KpA==
X-Forwarded-Encrypted: i=1; AFNElJ98ePW9OLNrWyG//OVNodgxCAqb9Re7i7PTBpmckV/8psDJ6topvp1CGeIXi4zKDtpGGSMKFtwdjCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6uqDIiR++RHk8NRR1V5XyWsbLeKq35K5x0u034PHpj5lwBmS7
	PWTCqz6L0T7W/o0fBAy9PoW2FFOOFQZAN0iihS4eJrmuUFEnVn3LnaZE94zGZUaaCii7dhv5WRn
	YNwz+Rr8x0GR2BVZ/ewSOJm7ZTHN+ZIZpOnU/3peSBC2z58n7HAUOXh/DsrwAhIQ=
X-Gm-Gg: AfdE7cnMBi9mzdQD1WImQwd1El+FsEtduNbJKaM2N6T8rK1XXbI4ihpPknhO5i59+zP
	QL41q/xna6w4iDhADzuB33ErWo8EoAltDamJCiWZGa8P6QxZqvyI61A4dcKBFlZTYu0XS9nH7rP
	khhEO4wPcYtP38qDIpqrY3E72IUmEazOASq7A6Pk66vFMFePNC0VMtB5N4NwaiaRXkJR8FERB88
	A2i5MKuNxrRexJl8U0ZKVyNEvU80wCjyKpoD8v+0tD4ETp5/PrHltgX9rmaC0ldvyPjC/oT2NBa
	9YefM/V9ekSe1+tf7rE5Dym1mjB3RMkZ+B8woMWaGgneBZElESIiV+SccmeoXIpVYoPWgvbnKHw
	LPOfttJlMTso7b7FLmKvjfm3YV63WtTVmbV2HTDdvypGDY/UfzjHP
X-Received: by 2002:a05:7022:210:b0:139:8674:e45b with SMTP id a92af1059eb24-139a2100d61mr154183c88.14.1781798203867;
        Thu, 18 Jun 2026 08:56:43 -0700 (PDT)
X-Received: by 2002:a05:7022:210:b0:139:8674:e45b with SMTP id a92af1059eb24-139a2100d61mr154155c88.14.1781798203276;
        Thu, 18 Jun 2026 08:56:43 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm19671267c88.5.2026.06.18.08.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:42 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:56:34 +0000
Subject: [PATCH v2 1/2] module: add SCMI device table alias support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781798198; l=14505;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=0HZrOmJ+qQqa0s+dcFvL72a0kqPu07eI6PGHZlEPDpc=;
 b=9WSRH9ne8aLLo+tzaYzgdqFy6dx028pnRFmJG7K7Edm5X0Ne2EHWUMAwRwI31lNdxUax9WxAs
 a7Fi/LNAyQcAUP6JAyVcQSwalVU4ITMlrnmIogfVT5/rprfl3dj70A4
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a34153d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZmUj3zzfIyDtdAVRzD4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX2V4U587fhZoS
 kWHCsgvNEiQvld2XRlGxTYl7/F5/gTwBfYbPfv6ONUF2BE6ei1IfTqsUCKVaoDiqMnfuNXN3j/G
 foczfKvyfnLgY3yJKc+ZqzJgGXo0Or04JChr/1eiyBYyu1gKDl8C3G0XBhyTBEeI62f+ee4ZFrl
 6xhRN7VqKAbb+cogOt1uwKzElBgDIQIaJ5ZqaVvi8lmMFgvR431K5k9ZTX8qrN6za0M8FCWr2zr
 6IlKq0Xdp2+k4WGl4GyDpmCJMs1wC9uiDVeaoqNxdFsG4aU9d0d+kin4kmxct69WIbfY0+/lkMQ
 GuZIBEZpS+j+J8eJcigQK2qvc4e6E5wFcm+laUjdDFdhVc1RngDJMEMxJju3y+Xq5D8EDQUDwJX
 xAXoVAZ3yt6lNSUfZXpfGhwSxNNJN2XMRNta6eLLKzhz3zSYTCA6eMEQs98GV75g2tz/DH56COE
 zq/VEiXSE0X6uWVmyMQ==
X-Proofpoint-ORIG-GUID: Lw5Eq8270NGd6Fv7yg20L16EQV6TLFWq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfXwWMwkXrdv5K0
 P96x57UN7yxpp7A9Bt7IAtn228dLXwsNdw84fNYD2Y4irW2W9iSGH6pVt/r94lTJt7S+O8ySWue
 BUPzqg7bmW2jy7Fn4qOqI4Sr38veTi4=
X-Proofpoint-GUID: Lw5Eq8270NGd6Fv7yg20L16EQV6TLFWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180147
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
	RCPT_COUNT_TWELVE(0.00)[38];
	TAGGED_FROM(0.00)[bounces-6717-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:mturquette@baylibre.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux@roeck-us.net,m:jbhayana@google.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:p.zabel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:dmitrytorokhov@gmai
 l.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,kernel.org,redhat.com,linaro.org,nxp.com,pengutronix.de,gmail.com,roeck-us.net,google.com,baylibre.com,analog.com,bootlin.com,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: EA7076A171A

SCMI client drivers already describe their bus match data with
MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
SCMI device tables. As a result, SCMI modules do not get generated module
aliases from their id tables.

Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
visible to modpost, add the corresponding generated offsets and teach
file2alias to emit scmi:<protocol>:<name> aliases.

Use the same stable alias format for SCMI device uevents and sysfs
modaliases. The previous string included the instance-specific device
name, which is not useful for matching modules.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/clk/clk-scmi.c                         |  1 +
 drivers/cpufreq/scmi-cpufreq.c                 |  1 +
 drivers/firmware/arm_scmi/bus.c                | 20 ++++++++++----------
 drivers/firmware/arm_scmi/driver.c             |  1 +
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
 include/linux/mod_devicetable.h                | 11 +++++++++++
 include/linux/scmi_protocol.h                  |  5 +----
 scripts/mod/devicetable-offsets.c              |  4 ++++
 scripts/mod/file2alias.c                       | 11 +++++++++++
 21 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 7c562559ad8b..b9e29e124302 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/scmi_protocol.h>
 
 #define NOT_ATOMIC	false
diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..affa005bf8b1 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -15,6 +15,7 @@
 #include <linux/energy_model.h>
 #include <linux/export.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_qos.h>
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..70781146fa61 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -10,14 +10,16 @@
 #include <linux/atomic.h>
 #include <linux/types.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/device.h>
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
 
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
@@ -141,7 +143,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	int ret = 0;
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name && ret == 0; entry++)
+	for (entry = id_table; entry->name[0] && ret == 0; entry++)
 		ret = scmi_protocol_device_request(entry);
 
 	return ret;
@@ -197,18 +199,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name; entry++)
+	for (entry = id_table; entry->name[0]; entry++)
 		scmi_protocol_device_unrequest(entry);
 }
 
 static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 				      const struct scmi_device_id *id_table)
 {
-	if (!id_table || !id_table->name)
+	if (!id_table || !id_table->name[0])
 		return 0;
 
 	/* Always skip transport devices from matching */
-	for (; id_table->protocol_id && id_table->name; id_table++)
+	for (; id_table->protocol_id && id_table->name[0]; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
 		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
 		    !strcmp(id_table->name, scmi_dev->name))
@@ -245,7 +247,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	struct device *dev;
 
 	id_table[0].protocol_id = prot_id;
-	id_table[0].name = name;
+	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)
@@ -282,8 +284,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
-			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			      scmi_dev->name);
+			      scmi_dev->protocol_id, scmi_dev->name);
 }
 
 static ssize_t modalias_show(struct device *dev,
@@ -292,8 +293,7 @@ static ssize_t modalias_show(struct device *dev,
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..0fd6a947499e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -30,6 +30,7 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index 955736336061..1900bb77383e 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -45,6 +45,7 @@
 
 #include <linux/math.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/printk.h>
diff --git a/drivers/firmware/imx/sm-cpu.c b/drivers/firmware/imx/sm-cpu.c
index 091b014f739f..53a8d1cee5ea 100644
--- a/drivers/firmware/imx/sm-cpu.c
+++ b/drivers/firmware/imx/sm-cpu.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/scmi_protocol.h>
diff --git a/drivers/firmware/imx/sm-lmm.c b/drivers/firmware/imx/sm-lmm.c
index 6807bf563c03..f4dc198187a8 100644
--- a/drivers/firmware/imx/sm-lmm.c
+++ b/drivers/firmware/imx/sm-lmm.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/scmi_protocol.h>
diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index ac9af824c2d4..5e39e79a9d8a 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -7,6 +7,7 @@
 #include <linux/device/devres.h>
 #include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/scmi_protocol.h>
diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index eec223d174c0..57b91e931c5d 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -8,6 +8,7 @@
 
 #include <linux/hwmon.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 442b40ef27cf..3babc4261965 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/scmi_protocol.h>
 #include <linux/time.h>
diff --git a/drivers/input/keyboard/imx-sm-bbm-key.c b/drivers/input/keyboard/imx-sm-bbm-key.c
index 96486bd23d60..36e349136ee7 100644
--- a/drivers/input/keyboard/imx-sm-bbm-key.c
+++ b/drivers/input/keyboard/imx-sm-bbm-key.c
@@ -6,6 +6,7 @@
 #include <linux/input.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
index 3693423459c9..741375ad325b 100644
--- a/drivers/pmdomain/arm/scmi_perf_domain.c
+++ b/drivers/pmdomain/arm/scmi_perf_domain.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/scmi_protocol.h>
diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f..0948d05c9e3c 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/pm_domain.h>
 #include <linux/scmi_protocol.h>
 
diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..332e4e26f1e5 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -10,6 +10,7 @@
 #include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/powercap.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-regulator.c
index c005e65ba0ec..f55f228cb133 100644
--- a/drivers/regulator/scmi-regulator.c
+++ b/drivers/regulator/scmi-regulator.c
@@ -25,6 +25,7 @@
 
 #include <linux/linear_range.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 4335811e0cfa..a6739df1d3c2 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/device.h>
 #include <linux/reset-controller.h>
diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
index daa472be7c80..c8643718cef1 100644
--- a/drivers/rtc/rtc-imx-sm-bbm.c
+++ b/drivers/rtc/rtc-imx-sm-bbm.c
@@ -5,6 +5,7 @@
 
 #include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 #include <linux/scmi_protocol.h>
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..769382f2eadd 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -473,6 +473,17 @@ struct rpmsg_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* scmi */
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
 /* i2c */
 
 #define I2C_NAME_SIZE	20
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..61f5ecfe0133 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -951,10 +951,7 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
+struct scmi_device_id;
 
 struct scmi_driver {
 	const char *name;
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..da5bd712c8da 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -144,6 +144,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..a5283f4c8e6f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
+/* Looks like: scmi:NN:S */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+	DEF_FIELD_ADDR(symval, scmi_device_id, name);
+
+	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
+			    protocol_id, *name);
+}
+
 /* Looks like: i2c:S */
 static void do_i2c_entry(struct module *mod, void *symval)
 {
@@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},

-- 
2.53.0


