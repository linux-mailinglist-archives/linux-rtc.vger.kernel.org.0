Return-Path: <linux-rtc+bounces-6296-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id op0DHZty02lFiQcAu9opvQ
	(envelope-from <linux-rtc+bounces-6296-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Apr 2026 10:45:15 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6F3A25A4
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Apr 2026 10:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 054F830107F9
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Apr 2026 08:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECD83128C6;
	Mon,  6 Apr 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOTlqy8R"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA330AD1C;
	Mon,  6 Apr 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775465060; cv=none; b=q5ES8tk8ODu/T0rftpZpRYHMhLrdGrnC2+TvPl2sJAIb1tHazcqDobcrox7H95VzxtSwWxo2spIz8MIOAn+9/mlhIjuNMwZAINwCaDbFe7C7iylrovezf4KfUT2y77qbqd8JUYD+Oef40u615RMYoFuZmccYqD6JZk0gnlK3AR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775465060; c=relaxed/simple;
	bh=0KHcQA9Wm6H3ZB+6+dnZsCQ2PfCwDIT7mjTHzYa3pdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktbyvYyJIqbHYhSrdG/vQTMssDXHlzrJWUTLlHBMu8UnhReqOi0sf2jTFj+jGsTyZj/fSll6Z//b6/XMVJaz2a3QkKX8gy5aLqZhSocjSgSPN8R4rghSwTfItGjbuFBhM5SpDUQRjfSC08McVrLTAZmOdR6HzBe/8bcAZcI11fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOTlqy8R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B76C4CEF7;
	Mon,  6 Apr 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775465060;
	bh=0KHcQA9Wm6H3ZB+6+dnZsCQ2PfCwDIT7mjTHzYa3pdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOTlqy8R5pm1jMPr95LxiJl2hJnbe/F2PlQyXKL6pcWYW/yFz1qERBZfyoif/3uIN
	 5OxkcaGbhiUvXjcMeAlrJ68C2P5TI7q4k/Tbzm3Cf088U/pFKp0ivWK901etke4iqI
	 W/EpmNQMcikMsI0MyR0ykrGIzW+eKIV3AStkWVFPhvdAp+qlAVs2097dIgJ1s50Xje
	 4Dzmo2kJ+BwdVZQC0sdeC5wrOd+7Dox39HDNd6/KEQRcEh/rX909tg4eb9FGLM88fv
	 BWUTInBQjzqJMFkfKqFgu8KN2La2n+NxrfhU/nBp9UZV3X01xNbLiYA3pBUDrKFkXm
	 tfBChQIQN83Tw==
Date: Mon, 6 Apr 2026 10:44:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Avi Radinsky <avi.radinsky@gmail.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: moxa,moxart-rtc: convert to YAML
Message-ID: <20260406-sweet-singing-platypus-fdbba1@quoll>
References: <CAK=E+3BLMV35g1hC2=aQ57yKxgw1y8qR8ufpHQdKcx4MdT9ioA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK=E+3BLMV35g1hC2=aQ57yKxgw1y8qR8ufpHQdKcx4MdT9ioA@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6296-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBE6F3A25A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 09:31:36PM -0400, Avi Radinsky wrote:
> Convert the MOXA ART Real Time Clock text binding to YAML schema.
> 

Same comments as for other try.

Also, do not duplicate work.

I don't find hopping on this entire GSoC program, while doing duplicated
and uncoordinated work with same issues, helpful.

Best regards,
Krzysztof


