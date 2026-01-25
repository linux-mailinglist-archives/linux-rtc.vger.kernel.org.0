Return-Path: <linux-rtc+bounces-5881-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGkSOedvdmnyQgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5881-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 20:32:55 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864C8236D
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 20:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B8AD302336F
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 19:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3292F3C3E;
	Sun, 25 Jan 2026 19:27:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2272F3621;
	Sun, 25 Jan 2026 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369249; cv=none; b=DeGHqKGneXhwctOMxWEqtStrUj9pv93bZMecrqDuO8GIdwD7ZlF1IcvEx/oK3GkKREfYH/JtECOSnCnkr+Zfer1DJQvvOsiS8DbBXGA7O7nrnvlGJ7jDI2LI52611bhLYkw7YMUnHU121H1glti4zPRn+Z+OHaxN0Mc00lc8snM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369249; c=relaxed/simple;
	bh=oA07w5s4KAvo7uGY9SwKimeT1sOcy1COae9AtRbd8No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqCJbMRltv1/S+ebWA8DEIJsHMDfNTIZcIbSAWSl9ZtVubRBbskR/IGHDvX6OHr3mcYjvL/yh9P4Yw2+H7myaZ20BtUBP3kfNTOFF+wbXCM4YLGPp0borJOfmdLEW8E6EKcCXR6K8zNV8e3vHObJnS02+1BUs7GvNtk+KngRS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: mxWQkpTTSc+iki9PEnQy4w==
X-CSE-MsgGUID: W+Kw7cDiSaaK/Su6uRoBxA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2026 04:27:27 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0EC974035223;
	Mon, 26 Jan 2026 04:27:22 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2N support
Date: Sun, 25 Jan 2026 19:27:03 +0000
Message-ID: <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5881-lists,linux-rtc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,bootlin.com,kernel.org,glider.be,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4864C8236D
X-Rspamd-Action: no action

The Renesas RZ/V2N (r9a09g056) RTC is identical to the RZ/V2H
(r9a09g057) variant. Add the compatible string for RZ/V2N and
extend the existing RZ/V2H reset configuration to cover both
variants.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
index ccb1638c35b9..988bb9fa8143 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - renesas,r9a08g045-rtca3 # RZ/G3S
+          - renesas,r9a09g056-rtca3 # RZ/V2N
           - renesas,r9a09g057-rtca3 # RZ/V2H
       - const: renesas,rz-rtca3
 
@@ -82,7 +83,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-rtca3
+            enum:
+              - renesas,r9a09g056-rtca3
+              - renesas,r9a09g057-rtca3
     then:
       properties:
         resets:
-- 
2.51.0


