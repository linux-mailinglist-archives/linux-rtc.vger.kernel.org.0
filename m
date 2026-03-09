Return-Path: <linux-rtc+bounces-6157-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGPuIDmMrmnlFwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6157-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Mar 2026 10:00:41 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2760D235C9A
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Mar 2026 10:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17590304B03B
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2026 08:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DB7371042;
	Mon,  9 Mar 2026 08:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="p+kffUFE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D72258EFF;
	Mon,  9 Mar 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046730; cv=none; b=nqc+LsU8Oy5V4KFcmxtsG40AhmBYTqiw+9IIgVPvJGocRXIgeiIfcxNmvgwrIqmUPS++Upol/27WWAlhFKnjly1/yfm3n48FZ9YCTf7EnMivbuFQ8Yuh7Efq8YoPmyg7Gxc+TBbKlof34hXd8QIT08KLyyDTLQ+VQvJmDRkuAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046730; c=relaxed/simple;
	bh=XXj5OZL3ekp1nSkUNm5xppmIFqX9DUEsya/2KpaE5EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lM7J/PVyUw9PS4Ao7u8PrAYW43oRVvNVo/EOdkPsEPHo8ng07Zy4Wx4A0aXZk3LoEIJGdAXL4+AEIQFMXAoJc1cBVdkcwBois35kRioAvd28ZAypi4IAOXGGJKqJ3yuzc9Ks+Ru59RLLSligGvU9MOXqckGjQpIVsZtEX3XvVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=p+kffUFE; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1773046718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/B+tp3dMy8sqBzmYiyFqnMtBSEEAUxty5oGaDhbN/AM=;
	b=p+kffUFEbHZYejovDReYNvDAUvMRA0dtoJ4laIn5aV1FcR5KUpQp7JAsN3OYKyxhaW+FnF
	QqmBUrX1zrz8tq9JYpmH+1aSg8GFGHAQTYx+eaSk7n/r+OhM8NP4qkNqvH7WvbgGWC3DQo
	XBrjnyCDuDPB7+dHVeGmjvzzPxf9bXU3e+UhCFB+Ke19q5nclT9o7M6c8x1RlAz4uukzQx
	xsh8/QBb2Xs2WYoV9kGkqIfW9/b+UFOV7CoFkwJZu2yQGiMgxVbNypXtE37VWTAqQQTUlL
	S2ALTUcciFyhS9btFmHjJkTrMjeci9vcfz1xMbndVrEV/RZwSnxUtvzQIiMdcg==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH v3 1/2] dt-bindings: rtc: microcrystal,rv3028: Allow to specify vdd-supply
Date: Mon,  9 Mar 2026 09:57:42 +0100
Message-ID: <20260309085749.25747-2-frieder@fris.de>
In-Reply-To: <20260309085749.25747-1-frieder@fris.de>
References: <20260309085749.25747-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2760D235C9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fris.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fris.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[fris.de:query timed out];
	TAGGED_FROM(0.00)[bounces-6157-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frieder@fris.de,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fris.de:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kontron.de:email,fris.de:dkim,fris.de:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Frieder Schrempf <frieder.schrempf@kontron.de>

In case the VDD supply voltage regulator of the RTC needs to be
specified explicitly, allow to set vdd-supply.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
index cda8ad7c12037..2ea3b40419530 100644
--- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
@@ -32,6 +32,8 @@ properties:
       - 9000
       - 15000
 
+  vdd-supply: true
+
 required:
   - compatible
   - reg
-- 
2.53.0


