Return-Path: <linux-rtc+bounces-6964-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fnl1KXUgUGqXtgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6964-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2026 00:28:05 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E5736077
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jul 2026 00:28:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cjGrZuay;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6964-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6964-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 550FA3055E80
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jul 2026 22:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1C23E1691;
	Thu,  9 Jul 2026 22:25:23 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C71D6195;
	Thu,  9 Jul 2026 22:25:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635923; cv=none; b=ljaHh/j2AzTAB9MLYsASVhYQdKxHMflGwwXLTHa3Rd/Emmcp+0RVd8RIyLbNT5iYWjYkgPDZYwHgIcSx21dfnDfSHeFRywTyHF0Jg4Ga5GPTdrTYLwupg5Xsp/OUevgpV3+JOjQ8Ct6LH7lNc809PAgQQhU8r2K/RJw/qm8QJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635923; c=relaxed/simple;
	bh=z9W7j5flQCqmTqsNEYyuQfjO5wH86VqpA1HqUq3Kacc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s0OHMbzc9qsuzXJJYltAhuBod4HbhAtqAVErKslT8iBq1GyD83QP8w3TWqyGm14TjfE+UvhnVPvjEakLGUzocdv/DEoRu4YhPKaC4cL+puFGRClilhYVzWO9PxOuvdjF65ck/QdRU3zV7BMM2tUJimGFHmyU85v81P0eS6BRP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjGrZuay; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B861F000E9;
	Thu,  9 Jul 2026 22:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783635922;
	bh=z9W7j5flQCqmTqsNEYyuQfjO5wH86VqpA1HqUq3Kacc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cjGrZuayIWMCSvkLl9HKCehgbY+nkv+LDTltNwHmzVpiQjepGcNVl/hQcRVRDINSj
	 hDxdJZzTlUj+iM/3dgJm2ZyCQ+TLPRyCKWW/9QJOfDBKNt/OuEqf7nuhRBs7If8wog
	 HDHqxd6hLSBQnaxPfu2bhR0/77OesXvtzdL/SzHqar07Zr5zTiI0h4zbws7pjDKSlU
	 drj0AxL4aClYiXL64YJYeJYzpEJpeJm6nz74kAIZsWywu9eZ5IEet7yg4tLGGt6HRu
	 1dqMimbp05oAkWBbvVJfsAzeBck0q8I3IwgZ0Eci1AS/xmQVujqC2ufV4CuO2FDo0R
	 8jRtV/lES1TLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Teja Sai Charan B" <tejaasaye@gmail.com>
Cc: conor+dt@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709221944.159244-1-tejaasaye@gmail.com>
References: <20260709221944.159244-1-tejaasaye@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 22:25:21 +0000
Message-Id: <20260709222521.92B861F000E9@smtp.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6964-lists,linux-rtc=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tejaasaye@gmail.com,m:conor+dt@kernel.org,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E19E5736077

> From: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
>=20
> Convert the rtc-cmos devicetree bindings to dt schema.
>=20
> The original text binding documents only the motorola,mc146818
> compatible. Existing in-tree Devicetree sources also use the
> intel,ce4100-rtc compatible together with the motorola,mc146818
> fallback, but this was not documented. Document the Intel variant in the
> schema so that these existing configurations are accepted during schema
> validation.
>=20
> Signed-off-by: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709221944.1592=
44-1-tejaasaye@gmail.com?part=3D1


