Return-Path: <linux-rtc+bounces-6347-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMviLTWs4GkCkwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6347-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:30:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1558D40C610
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2123531D7D3A
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 09:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61C7392C5F;
	Thu, 16 Apr 2026 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Fw9/Eyob"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7738F92A
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331470; cv=none; b=muN6mZLRF0smF3TDt1lYF2Mmfub+mB8fP5D26UFqbKktDdg7dj+dGsnkbiEBHfMkWOzMq7+17/avceCTVUHGle9FZVgStGkS+TMk052HHIKQ1jlA1Fgf0kJE/tOGrmq5gx1mDQjp3N6w4HoAlF7qn4BEYX/GkIJ3HtiQ3fLYopw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331470; c=relaxed/simple;
	bh=paOrT4Um/61XT1noEDF5hTa2aMLicFVrvWEmzFdKUeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzMcAe62cWLcrLBcgYD1BcKVEOPKrSAk23bBpnuxtH68Z1HRjK1q7wmQp0zh/EO2ZTyztm6AijXKs3tliLuj1HoVvtS5HXVqhgPkxinRIzaPc/PlcfBj1/RxtyzsF8iAdvaU4WuWGMMaFlNW78bqwd8N8staaut4nBEzY49KPxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Fw9/Eyob; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d9472c97dbso161316eec.3
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776331468; x=1776936268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fdzF5y31CufKiwD2VPREbxrsOqwPtssoG5QIcGgix0=;
        b=Fw9/EyobMR437xaNAuD7amVOZJ4KmMqRj87I3Tr9/HK/OG2dOI2FBSn7STlOtxg4NA
         nYki6bYTwVIN45ZbYw/R+Pn1HXBvSpkXRxgSf2eUzN9+MHKdKWaseZ1OLhVzCEhzU4r/
         P4KjlLERfI5Ywq8tUFL7TdIlQj0+BuG41kr/1wvEiS5wwWVawzwll9ucvx9UUcmGfYio
         ugc5eXJja5DzF5wwtyP9VPgMloxkGBP/oGAPFbSLUPNv4sKuadBZU9impxu6NWFdpGO2
         9pJHZg8q12Hv9sSrSGbl+3g+yvxEa2MaqAjnFEOhChbpOzJOKQlJaSfz7LagELV2N5jR
         JQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331468; x=1776936268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fdzF5y31CufKiwD2VPREbxrsOqwPtssoG5QIcGgix0=;
        b=Tml6TPvQFVpWYu2E4ApYZL9j0gvSX2g4vfUc/xFcNJhPYqQNYtK90c+8EVcxbaCtoo
         SjBLWNxNMT9C5a8mivZ0bsddRUsY8VdVqpDMmll7HLddTIjHzse9ohnlc0NJW7VD3z9I
         eV+3WFrU+Qvxpye3cpI3AtVYLildOz2jNWXh0T/OrGFMzkA1XMXoc4bar3wP+rTmBhgi
         f6n7fqEfqoGpJNl1cTWs6SmaBFCLz9myZaC4+NUiJXwHVkc8JEZIkJI6QXkxOZglNJZs
         XOOs6GXbNZj4OST96tPZAFdeN5Tr3ZCD7zfR2CaZr74gNlfQ0cXvYpfP8umj0dD4H/q4
         RPuQ==
X-Gm-Message-State: AOJu0YwFq3XZJ42kCdyhxBP+U0ziC1Lr1gE1SwNJwLM1XPHDJ3kdPp4W
	xklBPiCC2waYd7ZaD9bSOMvCJAB6TgSvveB5pyLPCblBhGAtK70P7YHpBRvkz0CTiA==
X-Gm-Gg: AeBDieuy4rcaPhFKIlp7/I1nXU6aM+d9c7yhkmBwKXefFEGuX8ejici9X7e2rkqb9ot
	9lqL+i4JX+Fr8GI8E3/qfENm+xk59tlgUqsFhWXjnVe/yNFhYZ62YJT1siozPuynI/ROjZkQ3Zl
	R64jcZMUavn9oIIViC5F8y+zBRpLKHWBkPgk0LFf2o68ldXc3M8uBdzOxxyccGdRVcqXXwtPXmB
	l9oZpuVZCunQ1+BhRdl28REqYO5oP73JtcqxJceO0zMeDGRISu7m1/TXl98w0Ph0Tqo2SeJIExR
	STcBqc0kkwliSw5CIK2aVNKaPDLFtFfkxVkeD1ynvUFz+thZdc/Rtbq3BHhJ2mbnaWwbQVYR2Ta
	zKql1aw+7JtilHWxUK4MfU5y31jS8CljiGkdb+OqXYYhVoWWJfEBOdVJTXoC2zPHANXpsbPqKyO
	UXltd0iB8m0PT44v+3ls9K8IM3c5EDZrLjg65ruQAHm/n/n+aZczya36BtQOQ=
X-Received: by 2002:a05:7301:100a:b0:2cb:de38:c76f with SMTP id 5a478bee46e88-2de7c7615c9mr1268443eec.6.1776331468290;
        Thu, 16 Apr 2026 02:24:28 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm6423815eec.26.2026.04.16.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:24:27 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v1 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
Date: Thu, 16 Apr 2026 02:24:13 -0700
Message-ID: <20260416092414.3210383-2-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416092414.3210383-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6347-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[arista.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arista.com:email,arista.com:dkim,arista.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1558D40C610
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a configurable device tree property to specify
if a microseconds delay should be added before reading
the RTC registers.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
index bf9c1c4ddb7e..c7c2720a336b 100644
--- a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
+++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
@@ -29,6 +29,11 @@ properties:
 
   trickle-diode-disable: true
 
+  ti,read-settle-us:
+    default: 0
+    description:
+      Delay in microseconds to wait before reading RTC registers.
+
 required:
   - compatible
   - reg
-- 
2.51.0


