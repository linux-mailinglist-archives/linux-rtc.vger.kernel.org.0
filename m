Return-Path: <linux-rtc+bounces-5946-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBgwLkjJhWnAGAQAu9opvQ
	(envelope-from <linux-rtc+bounces-5946-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Feb 2026 11:58:16 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F624FCE65
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Feb 2026 11:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A845A3003818
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Feb 2026 10:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E7C392C51;
	Fri,  6 Feb 2026 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="IXuE0Z8T"
X-Original-To: linux-rtc@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB8309EE7;
	Fri,  6 Feb 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375493; cv=none; b=HGxLwizhH6NkKn0tfrMdtS2XBetH+D6O5LolSOfloDmIHPkv12d3PULZdXxEzqDvgSrsaPcJWWCGruNGyIcQl90jm6SU0wxnGyGSj6HBHm4ze31fSywe7uAlAbbL5+LBWuaRXvYIjC3bdfoyXIt7wDSwRicCSsk7VIcviqCTdEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375493; c=relaxed/simple;
	bh=kenUozXkKSW+3e10XK9cQ/jFaolbja/kHF4Q+OUfPMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9PeCrLIVD0tlE8Ubc3ojqs1HTRsQBtjuLfSpTkn1+Hm/o0uZ/ugrORNRN7TZIEY2XOdF2J7KkvZ48dpiLKSAErlRnLio2egmC3WhGhHCkLYc0UUxRwNrKWd2HpAiJbfzT+aRyHcK+Tg9YXOpqyDPV0NWZmExMqAj0SuP3s4Q9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=IXuE0Z8T; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=8ANb9onDdaVcYdsoufhva+0OyHpF8IK2xM3N3X0tI84=; 
	b=IXuE0Z8T7Cz4E0mzWjVZzxGK3GXk80Yrk3p4iuNnf/c1OEEcBfK+fRNOY4oTWUsuJyzcuuKtxtZ
	bZTWLHe+fErkQMKhlhTKSoXPH7O02A9vd63oBrri9iVVleY4+DVGPMqmaV6IjhzFUDVZM+bLfxpTO
	1/6hYosKjn7jAV5gocOxcZXP9TsnQpYj1apFF0QK2O7Q3e8B+1sNFNmNhx2K9t6J9iFT6whMQeD+y
	i4Su+UIC+gdOyjvZHIQ2hUxi9MjaE9wTdfW4rhSxb/TISYoi/gPyZ4hgXs9zDxD8ECeo1Y77aMdXs
	jk+zTFg/QJq+tOKC/OFXRDbHBJULu3brTplg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1voJX6-004zTg-2N;
	Fri, 06 Feb 2026 18:57:53 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Feb 2026 18:57:52 +0800
Date: Fri, 6 Feb 2026 18:57:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: rouven.czerwinski@linaro.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/3] hwrng: optee - simplify OP-TEE context match
Message-ID: <aYXJMKtRIcbGxJ3x@gondor.apana.org.au>
References: <20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
 <20260126-optee-simplify-context-match-v1-2-d4104e526cb6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-optee-simplify-context-match-v1-2-d4104e526cb6@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5946-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,apana.org.au:url,apana.org.au:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gondor.apana.org.au:mid,gondor.apana.org.au:dkim]
X-Rspamd-Queue-Id: 4F624FCE65
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:11:25AM +0100, Rouven Czerwinski via B4 Relay wrote:
> From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> 
> Simplify the TEE implementor ID match by returning the boolean
> expression directly instead of going through an if/else.
> 
> Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> ---
>  drivers/char/hw_random/optee-rng.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

