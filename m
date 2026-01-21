Return-Path: <linux-rtc+bounces-5811-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIbAEZ+TcGl6YgAAu9opvQ
	(envelope-from <linux-rtc+bounces-5811-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 09:51:43 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5F753E2C
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 09:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DDEB506966
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 08:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EE63587A5;
	Wed, 21 Jan 2026 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKE0goIT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395AE3382CE;
	Wed, 21 Jan 2026 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985342; cv=none; b=aw1rTBo7PmtTK0QpjcbGJd/9g7Gz0S0oqhifyJLqSooTnA0sAJyBBX6u/pieKdXo89ZtsFZhqwTMuX8GSkr8OaNrU2mYqzFLn6Dc6SSapjqfxdt55gwpD/xn5noiBXaGjWDwnOa5sUs6O7B/kjc603p/PCFjOG7yV7zFDhZ0GiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985342; c=relaxed/simple;
	bh=AROUgoK5JKmkeY3ZuULwQ5Ymuu6lMrVUbdjp1Hj43wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XA73HHvIraPZo9GyTv98N/eqTx1JyyX2JfMfxf6VlIr9GAGM+ZBCfp7fiQL9UgNOSfk5PNm6wE+AnBfQS4d815AZ4NFYrBykwIbRK02f4Gy/KDa6z6Dct6Lmdk0PdZilY79CobwcUuYODPo4k/onsbF6VH6HBqkT6qKnZ9jbgM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKE0goIT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F4EC116D0;
	Wed, 21 Jan 2026 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985341;
	bh=AROUgoK5JKmkeY3ZuULwQ5Ymuu6lMrVUbdjp1Hj43wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKE0goITgY7yd6fIQWK9OC79EzjJDbvGbDemvIKMBveyaAdvcMfXlHAxq8Awq70RF
	 roG79/IG/MRyDhHao32o1n/ou3j5mTrzfpQShkqG+paA6j6C1sO4imiwZwdHVzsQ3c
	 NKMbfRC5BGgrQxWv3v8yy2La6kdKEZYgT+fho8SxOnr/jRzx2hKHcRFWdr9FJLmxkJ
	 YIqOZg0JBmtRMokppohHydrfOkvf6V+sFo7oYnHNOzBMWJTyZfk0jGP/49vxmxbfXX
	 C89V8TGKnu9qH+68EMj8mS3kdggfQFQUd/GnzwQR+Q/EHBV8afYdSTbx6tqeIXLWMr
	 LMkytRBJOGnhg==
Date: Wed, 21 Jan 2026 08:48:53 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	tools@kernel.org, users@kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <20260121084853.GB2367337@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
 <176892415694.2292562.7457528145774108517.b4-ty@kernel.org>
 <20260120155241.GG1354723@google.com>
 <e9bde783-42f3-4f28-9a5e-aa65f36db9ca@sirena.org.uk>
 <20260120172405.GI1354723@google.com>
 <916995f4-60e0-47dc-abdb-8819089d103c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <916995f4-60e0-47dc-abdb-8819089d103c@sirena.org.uk>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5811-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,b4.sh:url]
X-Rspamd-Queue-Id: AD5F753E2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026, Mark Brown wrote:

> On Tue, Jan 20, 2026 at 05:24:05PM +0000, Lee Jones wrote:
> > On Tue, 20 Jan 2026, Mark Brown wrote:
> 
> > > If you fetch a series but don't delete it from the database then (with
> > > b4 ty -d) then b4 will remember it and if any commits in what gets
> > > applied match it'll generate a mail for b4 ty -a.  Usually that's when
> > > some commits didn't get changed.
> 
> > The last attempt to apply this failed with conflicts.
> 
> > I wonder why b4 stored that as a success?
> 
> Are you using b4 shazam?  I wonder if under the hood it's a mailbox
> fetch then an apply.  I download a mailbox then script my own
> application after the fact so it's not so surprising that it happens for
> me, b4 knows nothing about the patches actually being applied until I
> tell it to go look to send thanks.

Not using shazam.  This is my abbreviated workflow:

 b4.sh am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}
 cat ${MBOX} | formail -ds ./scripts/checkpatch.pl || true
 cat ${MBOX} | git am -3 --reject
 kitty -o font_size=12 git rebase -i HEAD~${NOPATCHES}
 b4.sh ty -aS --me-too --since=1.day

-- 
Lee Jones [李琼斯]

