Return-Path: <linux-rtc+bounces-5848-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP8yO+O/c2mjyQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5848-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jan 2026 19:37:23 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 884EB79B37
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jan 2026 19:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 640B130039B9
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jan 2026 18:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1E523ABBD;
	Fri, 23 Jan 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRWoCZxZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC843EBF1B;
	Fri, 23 Jan 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193441; cv=none; b=c/T/w+hMd3J+FzdPm+YebWALEHu8uSl/zL+/8f3x6x7zdQCKyX8xQwBLzpbwNS/9c8e1hnMZlKy5CrOTzdW1G3LxaZJo4ObklnD21mB6bgHibia4Ag51Bc8UhZDpwubApPPfgKIdPzFlPkJT9/QpJ+F8UllCkpltHsRSpRlAYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193441; c=relaxed/simple;
	bh=eyrCLTDGqGhzzffyOwiEfQcLhlv2Dptd2OCd1PNPewI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jo/q9ucR9N71J0RwWGYKc4aidLNcEf5+cW5WN27Jvfd+be9zArVw8gW8XXpAxRwlRw5vSyjzNsypeO/js7tAMNidGYIu/gNIKJF56KDbzbYt1YuoFnaBYDO4ljxiZ/gh+zMGUOwgF9A97TXpboUg/oUtkW61KPo5vg4qDx9evFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRWoCZxZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AE0C4CEF1;
	Fri, 23 Jan 2026 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769193441;
	bh=eyrCLTDGqGhzzffyOwiEfQcLhlv2Dptd2OCd1PNPewI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NRWoCZxZBugswe7OL6wUvtXf3QU6qmqtCdcZcm838I1QjFY6WEsk5E2cwxS0+wnhR
	 W53MTfemDVvthisjXqn1vuF/aBotxgc7EBv1i3XEJWdcLnSTdutHfEhdsQFom85lDF
	 +tW1S76v99r95StSIb3SQ22kplODjG9gbtBI2uw1IH1fycd0zMFT4Df2wHVq2rFvNh
	 A9wbu+KcHa6h8y9HeEnTFYuC/zwgSTdc4EPsq2Jewsh/I630rusn1NPDxx3HpUAWEf
	 l6YUiyjLnghAXfZ/zomqv0Qls0f6SWPiJGP/pK1Kfnd4HvG7Wetcz0Qs0Up25DyGhF
	 wT90uw2LOliUw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aXJKvOJVrBIeCiny@redhat.com>
References: <aXJKvOJVrBIeCiny@redhat.com>
Subject: Re: [GIT PULL v2] clk: remove deprecated API divider_round_rate() and friends for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 23 Jan 2026 11:37:19 -0700
Message-ID: <176919343905.4027.446369039299053379@lazor>
User-Agent: alot/0.11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5848-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 884EB79B37
X-Rspamd-Action: no action

Quoting Brian Masney (2026-01-22 09:05:16)
> Hi Stephen,
>=20
> Here's a PULL for this large series that continues the work to remove
> some deprecated round_rate APIs. I used the following b4 commands to
> collect up this series:
>=20
>     b4 am --cherry-pick 1-2,4-13,17-23 \
>         20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com
>     b4 am 20260122-rtc-ac100-divider-round-rate-v2-1-044f8b493c35@redhat.=
com
>=20
> I skipped the patches that have already been picked up by others. The
> two patches that actually remove the deprecated functions from drivers/cl=
k/
> will need to go in during the next dev cycle.
>=20
> The only change since the v1 PULL is to drivers/rtc/rtc-ac100.c:
> - Fix two cases of brace inbalances around if/else
> - Picked up an Acked-by from Alexandre
>=20
> Details are in the signed tag.
>=20
> Thanks!
>=20
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/masneyb/linux tags/clk-divider-round-rate-v6.20-v2
>=20
> for you to fetch changes up to ed806240b8975f951c88ccb4bb75813f5fb949df:
>=20
>   rtc: ac100: convert from divider_round_rate() to divider_determine_rate=
() (2026-01-22 10:49:10 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

