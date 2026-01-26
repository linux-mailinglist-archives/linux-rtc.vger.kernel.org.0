Return-Path: <linux-rtc+bounces-5888-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB+ZIJc+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5888-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:47 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A594868A2
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 604C8304603D
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16CD32E750;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVYmsn5U"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C17132D45C;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422287; cv=none; b=mvwaEr2RqUfONNPu+UMuhrTTTju5RxdaIlv+NCEU+kaowhRZdIjv8GDvzz6K30CiP5Vzv7b/b9JRE9qWxPNWciQBaJi2w7p48kQywdk6P0KreW2UenQDn33H6QdKLaC8uTpTDoR7vQfxKBCtiO7V4cCGJlmQNMNp07lIo8Sqzyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422287; c=relaxed/simple;
	bh=iOcjZhzgQVcuWp44oRjS0h3QZ3gyXy6Xzg50V1b0oeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYvhJ0zrFZ0p6BADXZiEwR2xHBO8NGhQ99Cl5caSvNRPeWai64ZGc+jVCO2eweplrhbMfUyvq3xcBBCFZiL218/KJ2MaZMxfTL/fx5j9uuS+qfCDEeETlzdYG0iWli/oE2R3gn7GzT+Zm2famtxlvdlnrMi5GFoMqLga0mmQncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVYmsn5U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 465AEC19425;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769422287;
	bh=iOcjZhzgQVcuWp44oRjS0h3QZ3gyXy6Xzg50V1b0oeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UVYmsn5UReRAkoPpQBUx6Au2VSA/xm4N0yJJGhGGgW+BOp8yI3CiPdAS+O1KXY+4D
	 s5xXBWtitIVT0rKwO/adQZjoAq2n29llcIeVrGYKB2nDftpTl7PvVk5JSHsL97wWIl
	 h8zEewbn+KRa1y+svnxFp8legvB/rrNA3b9W5Fk348F/bOucIzcyYt9JOCxofBQf3a
	 bnX9G7kJl7FOHflu4slFcxTiOhJWXeVuvFsnxX3IpJRDKEj6fljT0qYgWCyWh3KmAb
	 +f1C4Sm3DBhFQFO3993lbHpfW/YEjrKI9eBuFyeEfT1PR8Cw6YZj08SYL9zrinzxuc
	 sDKRHEkfdkmsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EBECF65CE;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 26 Jan 2026 11:11:24 +0100
Subject: [PATCH 1/3] optee: simplify OP-TEE context match
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-optee-simplify-context-match-v1-1-d4104e526cb6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769422286; l=783;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=Lim3HY4VT+Sv8kk77StbxRDzEmFNkh04aSoGtueluXg=;
 b=4Kb4IcXJ/tJ1NPTBhb4ailO8WqWg3gIUy0bYahni2O14sARl12J5KJprLVVfhvb0EsXQhEbSV
 mI7kZiXHlNaCzM9PBik4ckocZG7s57F3uXKm0n7pHLUBJmQXtTloS6G
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-5888-lists,linux-rtc=lfdr.de,rouven.czerwinski.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[rouven.czerwinski@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A594868A2
X-Rspamd-Action: no action

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Simplify the TEE implementor ID match by returning the boolean
expression directly instead of going through an if/else.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 drivers/tee/optee/device.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tee/optee/device.c b/drivers/tee/optee/device.c
index 950b4661d5df..4c85b04d6004 100644
--- a/drivers/tee/optee/device.c
+++ b/drivers/tee/optee/device.c
@@ -13,10 +13,7 @@
 
 static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 {
-	if (ver->impl_id == TEE_IMPL_ID_OPTEE)
-		return 1;
-	else
-		return 0;
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
 }
 
 static int get_devices(struct tee_context *ctx, u32 session,

-- 
2.52.0



