Return-Path: <linux-rtc+bounces-6303-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGAZN7FT12kFMggAu9opvQ
	(envelope-from <linux-rtc+bounces-6303-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:22:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7CD3C6F4C
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ECC6303BB1A
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Apr 2026 07:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07273793BC;
	Thu,  9 Apr 2026 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIBpX06c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A73378D92
	for <linux-rtc@vger.kernel.org>; Thu,  9 Apr 2026 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719291; cv=none; b=N2PvRxU8owyfsU6HgJ6owyWWT4aSg4o4PEDVh1/VKTaZk49kWOqAmsZ2K/Wcx7HcJVKIOnl64pWceVXWF3Wq/4izOHWd+C1Ljaxmyhab6MrIVdSOHo9RkyDGnikWkNZVoqPze4qr9HmaSIs6b55rmBvZ5OetByenOzDo6yN0i+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719291; c=relaxed/simple;
	bh=/aQvxwyfiMEttMc4XjUXTFf8VOx3i5lmxTbBl+aVsrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YYZbpYH6U01kZ8/oaj6jJIn1HbQeulL0OaChg+Gc5df2g0KEEqk3uqZg/zYAQv1yOSzI+2m0pb0j/+48XOAfxVQieC/+QCYZzm7Rrtq6RfCJp6i7/uRjtgyGvFAVBSQs1msOLIzVBLshPQ95vRQAYXyuHV3UX6MTNGd9cIej7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIBpX06c; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82c68339cf0so343629b3a.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Apr 2026 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719290; x=1776324090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RCwBZBvsaSuctATrpMWLtlus3Iz6VFiDekP6BgSoq0=;
        b=tIBpX06c+Ix6e8O9UKY59FslCdB3tnBS7B3fnJS/ljvlxuRTsxmoel1+TeNAcS+L8f
         3rkLLh6yd8Bt6hgV6i9b5d9TlsFg4SMxw9bqp3OeBZ1FkqyRI6BrQy5ha3HTEzaLh9ca
         UQ98ZliFVtLF/SY7M9en6U6l4YytZYjIS8VNbVSZuv1h7xmlpjUUxb8pVGCboetOBNLx
         TVP5gh3AcIOjJOANjUJJxL/43q5ZPHqluGxY7DTnea/o25QglEfRh+1V9VyB2ezGf/YJ
         ufu3XFJ1WXMwOg/j0s6lQmfeuQcCze+j+0VjHn6BEVakGH9kkXXMJrDE6JYLuP032ork
         kqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719290; x=1776324090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RCwBZBvsaSuctATrpMWLtlus3Iz6VFiDekP6BgSoq0=;
        b=ZqNHix0Jp51xoNMEarCOLGtknuOnsfLs7WeMD5UTKiklP9KL5PjPrDLpLwrJ00/CeN
         I+tCTs2u/nZ8pMlNDTowkouA9GKbEv+4jnJYt9vTdYjZxcLM6tVHR4Zk/TbbQll2th2T
         kzNFcNYyiQi1tdOQa01hsEooE7l9B1v3PZtkYvzu8dMOCO7Ex3RfCpuyCxaaej1IGHX+
         6iJ17/MipmKyzHpxhIMqt7Ex0GWSezl5EpVzqapt/lVCXWNwAn94Bzprzx/9PwUZqMSt
         RgSwtetCD/IlCngupricq+8b4e6LFYB9+1Nab4HiqIo6SmtL/dCxzq8Us8XETFaaLPOl
         +VuA==
X-Forwarded-Encrypted: i=1; AJvYcCXdBYOBtzLMP5GeGUj937Rs/Zh95sXhBVfg7EHZAhGWsohk8y9TeFPM1ZXSCpXy+Pfb8+lss01JXoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3yyhh7Zjx6yXMmga/PNpqsEQftsow6MJVo2Lh48epnDOfSqkp
	WdXNaorGdl7kaZ5rVeHaq18CarKR2wRgMmpjknhwS5ZMDflfmPR3F2bU
X-Gm-Gg: AeBDieuZkk6alKCzy8gokJzaBJ4GMcSqReqN+STgIT7AJpQnpJxlmOCxDGYl4oXOWfy
	ri4N18NmWAoBE2b4hal0IeYEMQhLK01i1IvJDM9nWgghYWSorc/l84cH1yZH8gJ4ISVSlmGmTWy
	Kf8qo0/BoiGYWpK3JEu2gtWKlhh0a3TrikGaLTe7keYCX8Fiaw+ki5UNdLXrCT+nkvAV8toG9Ip
	xaxSbFREXrQTZPfLo/a3nUn61uNKQioTMclphcWDsdeUKo5D1PTzVtISb1pTE57duIbkfdEB7j1
	+XH4YnXhvC3040MCWDpnUQ7DuHT9R8dDj0u0YTjdrpmDEKzxYyRKseRHsRYluYALWP6lo599P5g
	aUTYUh6T/tbHJe0fXld1V4pVGQNGPPbcYS6u2QItqxQu7cfwnBatk5r48bcMItUblfQQnflmcWw
	LghEReAPpm36z/Aj5Q4XOSVSNx5UrZ/LidJln+SBxmTQ8Ra4UCKxTyf/yTBvB/Z4Ecj3ORmDaOq
	A133CoI
X-Received: by 2002:a05:6a00:b60e:b0:827:2d7b:5038 with SMTP id d2e1a72fcca58-82dd8a1d9f4mr2094952b3a.5.1775719289983;
        Thu, 09 Apr 2026 00:21:29 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:29 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
Date: Thu,  9 Apr 2026 15:21:04 +0800
Message-Id: <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1775717959.git.tomato1220@gmail.com>
References: <cover.1775717959.git.tomato1220@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[aj.id.au,gmail.com,google.com,nuvoton.com,lists.ozlabs.org,vger.kernel.org,quantatw.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-6303-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomato1220@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.980];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,6f:email]
X-Rspamd-Queue-Id: 5E7CD3C6F4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add "nuvoton,ctrl-reg-val" vendor property to allow optional
initialization of the RTC control register (0x0A).

This allows platform-specific configurations like 24h mode and
write ownership to be defined via Device Tree.

Signed-off-by: David Wang <tomato1220@gmail.com>
---
 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
index 4f9b5604acd9..0984dfb77170 100644
--- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
@@ -24,6 +24,10 @@ properties:
 
   reset-source: true
 
+  nuvoton,ctrl-reg-val:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Initial value for the control register (0x0A).
+
 required:
   - compatible
   - reg
@@ -39,6 +43,7 @@ examples:
         rtc@6f {
             compatible = "nuvoton,nct3018y";
             reg = <0x6f>;
+            nuvoton,ctrl-reg-val = <0x21>;
         };
     };
 
-- 
2.34.1


