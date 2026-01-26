Return-Path: <linux-rtc+bounces-5889-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N1WE5g+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5889-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:48 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B90868AA
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DAA83046068
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B432932ED22;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euzudDIz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F132E151;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422287; cv=none; b=qxUYWDQN04On3l/qggfoTsIwY5HFYDNT9p3Vl8jIkbGbDVjRw0+uSV2Z5TQBeNA76syWg3ewfN8MdYsUwqTTXoZny3/ecABlqz/PIp33ZspKKHHXoOsrRcVETRyRlQ1BrL4FthucalEWCodO9Q4jpzV85p2IndGwu/OiGFfO3us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422287; c=relaxed/simple;
	bh=tDYIhxiz36gjJoQl3PD4STiraGAmWfjSN46yy4QfZ70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mmXpWT7QOJIDpPUM0+YSqA4AJLB/ivNtTvQY+lTTc7MB9+KuDljbLPWaEsNfzK+NXvSzbo7LOFPpz9qzfEXlOHF0WPTxGOTWEwxvqX353QUZUapk7fIXvk1lGp7Mo+XIRFk8b97me2NqzG66wX4dR2+xuEmbUkJwp82P0JvE/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euzudDIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35A74C19422;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769422287;
	bh=tDYIhxiz36gjJoQl3PD4STiraGAmWfjSN46yy4QfZ70=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=euzudDIzFHKOG14xvGZR1bpJcSZQndTyFmKDxgBq6/fADZAJh1pOeQsMZ2SxPZ9ht
	 kgv9qcrIlEPpE0idwiDyR5+IVQ3ZaNRW6lZjRyJNDizVMwCdwUBzWbMVZrC8mVSm96
	 eoivGoopL3uwlmjmKuyFDYuh/hYZcBxjKFo27fxZEv4O6Z+HDPuSth5rk3aiOrldPm
	 4qm/pPUNn1fYm9gEMpopAPClgg95xeSB5nGENUMJCj4g4MRQAqAGZjiCNAaICpy17i
	 gnlwkFiYfl1h9HO5mT4GosjBqF4haH8Q/9TCTeAaIvKDKsrhZaUVEx+qHJYnzmijDm
	 N/zx85Xk8DEww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2482FCF65D0;
	Mon, 26 Jan 2026 10:11:27 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Subject: [PATCH 0/3] OP-TEE/OP-TEE drivers: simplify context matches
Date: Mon, 26 Jan 2026 11:11:23 +0100
Message-Id: <20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMs9d2kC/x3MwQqEIBAA0F+JOTdQVgb7K0sHm8YaKBWVpSX69
 6Tju7wLEkfhBJ/qgsg/SeJdQVtXQJtxK6MsxaAapZtWafQhM2OSI+xi/0jeZT4zHibThsswd70
 eZ2uIoBQhspXz7b/TfT8vP92GbgAAAA==
X-Change-ID: 20260126-optee-simplify-context-match-d5b3467bfacc
To: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769422286; l=722;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=tDYIhxiz36gjJoQl3PD4STiraGAmWfjSN46yy4QfZ70=;
 b=6UdZd8aIRGT4L/9vrsiyrk5kkRQCa4+9u0QApVUg2I2zC/EDJOMyYlB50+svgmeaLWEmtkJB8
 cbObPWCi6L2AZqhKJIzHXabmOpA+4OgmlhEeAmksR98tL2uaWZkEYXL
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
	TAGGED_FROM(0.00)[bounces-5889-lists,linux-rtc=lfdr.de,rouven.czerwinski.linaro.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: E3B90868AA
X-Rspamd-Action: no action

Both the OP-TEE core and some OP-TEE drivers use an if/else expression
to check a boolean which can instead be returned directly. Implement
this change.

---
Rouven Czerwinski (3):
      optee: simplify OP-TEE context match
      hwrng: optee - simplify OP-TEE context match
      rtc: optee: simplify OP-TEE context match

 drivers/char/hw_random/optee-rng.c | 5 +----
 drivers/rtc/rtc-optee.c            | 5 +----
 drivers/tee/optee/device.c         | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260126-optee-simplify-context-match-d5b3467bfacc

Best regards,
-- 
Rouven Czerwinski <rouven.czerwinski@linaro.org>



