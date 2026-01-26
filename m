Return-Path: <linux-rtc+bounces-5890-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EDJA5s+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5890-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:51 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F8868C2
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D0930465F6
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94E032ED3F;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7dAxoKr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA7732E697;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422287; cv=none; b=n6ck2NNGsDxpno4ET0t2PIl1CERMJFiBzWRdXozp/q1t+e5WmF9SmqUuFLGAJ+MToAuQyoxzzbH1t0Uszs6AB//pwLzxmXXK3fA6Mda+F0Lyc3+fwXQ0xDqvhiBPTbKnGIEzTSSnN2DbnhVtKTEnPCRSW+VbJYerQLMqYfSqirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422287; c=relaxed/simple;
	bh=fBZcq8cvRjheDHCvLXxrccPqA24+Mola9mvDT4gcPLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9VwMyjbclSO3/lCGPNwvs5tHevwPwIPgiSoAl8hHq2Ci3ZmbhBzjRD0HLznwPyANYacf+M1a/jx7vqcFYgLG84vu1e+p14n0fo5oSxjZXP86tzqiiLtePfaC6bskGmQPA1gXcWj12fJDe2ZoxgP0ozAVAV0V5WnCmJ7Ctk89J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7dAxoKr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E179C2BC9E;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769422287;
	bh=fBZcq8cvRjheDHCvLXxrccPqA24+Mola9mvDT4gcPLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H7dAxoKrWDx/HdgM+UecgdSNqUzTLvhYkqidiceXqRYRaRhvMvIo0rJRR+buw45cc
	 3sht/20iEKBI3IT8JAYmXfHbshRl13FdO/KCXRQVF+Aq21f3/ybE9D0RgpsBa8hebJ
	 Fgimn0F2UJzo/hCEOgqsh8vi17Kh9nvVbWDjqT9WQwFnQuhnYKPSZKWUgZaSbjeOiH
	 RcXwTRSwPHn3UGHx7SD8aum7ueTjgZS75ar32/6iQGY5eI3wOhbzd1mlE5QlWCZC/s
	 O59pC5JdRPdVH/M0hZia7Rmca29prhqeTQUGUdOBZZX96/dQ1JLFKRCTiBJLTNaWLY
	 gPaSXrVwjZATg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570C9CF65D2;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 26 Jan 2026 11:11:26 +0100
Subject: [PATCH 3/3] rtc: optee: simplify OP-TEE context match
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-optee-simplify-context-match-v1-3-d4104e526cb6@linaro.org>
References: <20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
In-Reply-To: <20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769422286; l=831;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=QLdJDajsDAHZ5Jp/WvnfqKpNSpcj2i8eHxM4elD1BXk=;
 b=hUChSt/PerjC7blQ6RZipCBKxqnlwex+ECe8CfZ0Wb6SYUNshrn+Zn+ndFsgEjw9ve3jh9TQk
 BW08OOTuUhyCZjXixJ0Uk91h8vNM070X6eNfQyVTmMuXGcKhVgSHyg8
X-Developer-Key: i=rouven.czerwinski@linaro.org; a=ed25519;
 pk=/5pmUK/XIAIIo8JA0axgfy1k8NRhRTQkxVwZYa1ga7U=
X-Endpoint-Received: by B4 Relay for rouven.czerwinski@linaro.org/20260126
 with auth_id=616
X-Original-From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Reply-To: rouven.czerwinski@linaro.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5890-lists,linux-rtc=lfdr.de,rouven.czerwinski.linaro.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[rouven.czerwinski@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 602F8868C2
X-Rspamd-Action: no action

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Simplify the TEE implementor ID match by returning the boolean
expression directly instead of going through an if/else.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 drivers/rtc/rtc-optee.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index 184c6d142801..2f18be3de684 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -541,10 +541,7 @@ static int optee_rtc_read_info(struct device *dev, struct rtc_device *rtc,
 
 static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 {
-	if (ver->impl_id == TEE_IMPL_ID_OPTEE)
-		return 1;
-	else
-		return 0;
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
 }
 
 static int optee_rtc_probe(struct device *dev)

-- 
2.52.0



