Return-Path: <linux-rtc+bounces-6351-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMHXIoOy4Gm8kwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6351-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:57:23 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4908340CA40
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E43E3056296
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147CC39C65C;
	Thu, 16 Apr 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Aof3L7DW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA8381AEC
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333435; cv=none; b=tIBuKHkNMaHwZuMWfZADeNwrRxvvVXiC10uV/Z5FXeJFuD/mQ2Q4xqutMuo1Rf9tGUR0tvu36LSTkXKKj3aWrDnDawHue9axOOHKznJk6TH1XJs5rdzX12WDVHmbVTV8pfEFNkdMmRSn1H/Q2B2MgvrJRZy7ajv0U5ioA5w/vxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333435; c=relaxed/simple;
	bh=B35GEUiYL/i4rKfP8Gn+tSIfYFuWGyIXIcU6FNxorf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jY7eaIbP4cil4wfjYG7RUNn+mh5gPnlEAlBHBYLEw2SbJelyFJot1JKDOsgyQMeNJl6OduvtojddOdA0HdEB0hzTV1ymu06lcaaNdaC5/ZRiUCxOq6LfcpX1bUhJjdhvRlcjcgSHTQ8pg7I1B50PMKv3yDMo9SqTXIJysR1atbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Aof3L7DW; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12736a0147cso599006c88.1
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776333433; x=1776938233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVEo1CGXYrQb+Ske7PtqTrPoqQ9eYUg9aVr/T0Vf6Tw=;
        b=Aof3L7DWupwoJcKDUGZaU2bEMfpkIB7IYKua15lVjH1MBdhi1qwc8OrxirdAmHbJd1
         iKIrizLxfAeRNdga/oIW3mqCXMlMKMD3IqOL7CRU48omxrLVkJcOfsXXNLjc+JPSoOIP
         2/T6ci1ORsNz/Wg97svCUI9q/H2d6IK6GnahNfcV62YD8PeVR50q4kIHL5TKR9QNDJeX
         jFgb8fJrbwX1sIFwlOG7gzqkoDiyeKGC57ECEdGaG+/rnPpliQxHMwg7IVPas/6u9rfs
         ay6ICQjEdt60OTXOJv5yMd8ahln81PhHGISYhJ7LvLnd5Ds1f4aqvgGU5Y9u6L+YF+gS
         oO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333433; x=1776938233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVEo1CGXYrQb+Ske7PtqTrPoqQ9eYUg9aVr/T0Vf6Tw=;
        b=XH1c7f9Uwj7+huzX7yQJJ4B/bSa9nvFyfcNH1mpvBZOjB4Itv0yNFZDZSB2vsXWw4x
         ctHF0kfsd75KyO0J09H3actQXsOJukqRgPxgO4cdBNodE975jfliMYEIsBLY8JI3TGYn
         Np2ZZIP8uTtbaWhvcwiFkavkZpPwzJ+EmGegRddI/sAaWCzjB5dAcZrXYeM2BgIOB7Ny
         ur+ZjFGoBvJucVEq7VloqRndpI4bPquflzXfffQBYQn3wD/02uoma7X3NFOtW3DdJwqz
         B7T0KlANjxRfA2oweN9SdMQMC7wL+FB04U5B8DeLHa8qLVwQZPKovUOalNlly2aeDd3O
         espg==
X-Gm-Message-State: AOJu0YyCKlUhRpN5hTxFU9JnOL4g377Tk8ZWBxmg2awHGnvsVUSGonFX
	KV2mLUcx20QSS51ytKdhRnoY1+qX0SihjFGf4mylxvKjsR/atk7cFuOEOBfwT5QOwg==
X-Gm-Gg: AeBDieva72jGx9cdX3D60w0CACawyP5UOGIzLBPStFkEYIuMkevnjAF5c0F0MzXn/Rz
	hDCMPfO36cCy7K+NJem5xpMHa/isQizFwoPbWCkeYbVT7ltSddFhPD2XWm4QDFNdwnSkcWMpMYE
	Hdj+DsOqIA8aJrWZN5QXjoCRCAQpiVyHChAIct2wDExAMOtzehZRrt3kZhgJV6I7xG91Mk6nooE
	IzjIm+e0vJ+iNCu19L9/yyykzd0OR9gXXM0u+0VfGwKIEeS0wZPZFv5W+zCIHchTY74gCUC4fwa
	/8mBk8WoEUi5rzJbH58mq/uo+9WCKzhPsxsbdmaladVq8DUZxB6I3j5s74X1YOQEgp7xNbjbFDV
	FbDqYeOJjp89SmAbvq6bNj49LtnZZLSQ2IkWM0H1hWXVCysQZXKfqabXJGwNOdpxctoHxZIleOn
	HomCdGIfEtnckeLLqJYFcufiKhJ3kU08X2nqdFcqRTRR4n+/yp6Y77HRfqIZ4=
X-Received: by 2002:a05:7022:48e:b0:12a:6ab6:8a64 with SMTP id a92af1059eb24-12c652c1211mr357227c88.0.1776333432722;
        Thu, 16 Apr 2026 02:57:12 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm4532913c88.15.2026.04.16.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:57:12 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v2 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
Date: Thu, 16 Apr 2026 02:57:05 -0700
Message-ID: <20260416095706.3212158-2-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416095706.3212158-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
 <20260416095706.3212158-1-adriana@arista.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6351-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arista.com:email,arista.com:dkim,arista.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4908340CA40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a configurable "ti,read-settle-us" property to resolve a limitation
where aggressive I2C polling prevents the BQ32000's internal register to
update. This ensures the hardware has sufficient idle time to update its
buffer, preventing stale data reads on systems where the "interrupts" are
not configured.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
index bf9c1c4ddb7e..46403f0c85a5 100644
--- a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
+++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
@@ -29,6 +29,15 @@ properties:
 
   trickle-diode-disable: true
 
+  ti,read-settle-us:
+    default: 0
+    description:
+      Delay in microseconds to wait before reading RTC registers.
+      Aggressive I2C polling on systems without an interrupt line
+      can prevent the BQ32000's internal refresh cycle, leading to
+      stale data. This delay ensures the hardware has sufficient
+      idle time to update its registers.
+
 required:
   - compatible
   - reg
-- 
2.51.0


