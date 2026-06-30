Return-Path: <linux-rtc+bounces-6797-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DB9vHSsZRGrtoQoAu9opvQ
	(envelope-from <linux-rtc+bounces-6797-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:29:47 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D58936E7920
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oEaZMxvI;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6797-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6797-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B3603029779
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB373BF696;
	Tue, 30 Jun 2026 19:24:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E7282F1E;
	Tue, 30 Jun 2026 19:24:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847496; cv=none; b=h6afvrmE58PWCsNoJmBmxS9ebvZ1dzQTjgAts8xNXycb6N2xzePTz2XhfWNGZW+bVM/gEm4C2oymJSupV00Y4Mz4QQs+i3a8x0nYY7Khx9OefU60FGuHsW6ciLo9EsdYDN7X/hvPZppgFy9flGbOvHzOiriG337qiBBOLUacIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847496; c=relaxed/simple;
	bh=hqAUe8yBH7exQn2XAdv+Lc/Y8o9ItkY1mG8eIahUBo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ui9+x1hitm/oPT8QAPGye3vug18LMbI1Q9splSX5SyumkhUP1KHLj+v5x7C7BG0/XAi49vwzBpW/wBvTlUa16cnfo37xxVthZ31ydf/PCqTbc7734kmfmQHkDgJcC2fjJwBsCyLNrYIoSiln5zsD4RYStGda96sVVRrMrBxKWzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEaZMxvI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB211F000E9;
	Tue, 30 Jun 2026 19:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782847494;
	bh=hqAUe8yBH7exQn2XAdv+Lc/Y8o9ItkY1mG8eIahUBo8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oEaZMxvIOa8T5d65gn7rcQtafWN0w171Ww8LgiHTPHvOKYwwWp7FdsZi7MThZDYRK
	 YmFyxQ3tk5Psa+vXSJehD/WD6+IPLCnjPwSr+bI3yubnYSJdRWJccqCPR9FaQDE9uE
	 8cu0Wg3sW7bJ+P2bG6/p+jHl+hvlVGONjq3WwGlu7OMjBA8nJBauaegfIme7nCH1Pz
	 TJzzVAWbXM04CeycOn0/RdZgPiq8L+hcNmCExA72G+XpBFPadh6kVQgEhPDLp/qCiV
	 MUK/7+P/Z3lQK0vX/ABrJdAq4pzR3blzHdruKhAbAmx6uL/SyP5z8Fs8AbFqzRcaqW
	 sUahdnWmp8iKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] rtc: s35390a: Add missing newline to dev_err
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630-rtc_s35390a_int1-v1-2-1b2239e16be2@posteo.de>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-2-1b2239e16be2@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 19:24:53 +0000
Message-Id: <20260630192454.0FB211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-6797-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto,posteo.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D58936E7920

> Fixes: 3bd32722c827d ("rtc: s35390a: improve irq handling")
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-rtc_s35390=
a_int1-v1-0-1b2239e16be2@posteo.de?part=3D2


