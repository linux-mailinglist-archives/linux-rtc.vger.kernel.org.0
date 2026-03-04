Return-Path: <linux-rtc+bounces-6103-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCOVKqfvp2mWlwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6103-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Mar 2026 09:39:03 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF361FCBCC
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Mar 2026 09:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836A4300F514
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Mar 2026 08:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFD03914ED;
	Wed,  4 Mar 2026 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQFixfd4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF2382F35;
	Wed,  4 Mar 2026 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613255; cv=none; b=eXP5Aq74N1TfYdFBhIebL7b3ceUs5aSemlBnn8EDJgNAh8fSPVOFP7E7D1gjK3Jrr+BoYurcPJuH2ga0fe8/YcPYTvlLNhy7zMrEqZ4iIsqQtHg8StPuQ/LGIxBDl9Y/S9Jw9h8uCACawiqCtUQmxwBmpQHRay4TT8GzGpgJcHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613255; c=relaxed/simple;
	bh=ziTBDWIW9u87ppp3H8YLHxXrmlbuWtR01bSwg21V0Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZH0rsDkLjXlI1Ul9uKZeACClNn8PH48wB5+SUPHl25MllC1z/IxKn/g+D/Fhx3I8q8aKVEpnRxN9Aayk8+xzdUm8SvjcJdBij1NNdBRe2alnd9agORw0qkVtV5mCukVk4zRlQbyjfexkng2+PSeLUGDE+YIMHJCzUx7wTJqRRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQFixfd4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9051BC2BC87;
	Wed,  4 Mar 2026 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772613255;
	bh=ziTBDWIW9u87ppp3H8YLHxXrmlbuWtR01bSwg21V0Ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQFixfd4QrHOw1LVI/dUoEwBC+tW6PRXfGUa5uNDkW5x5dhVUdJyPCuucQLXN19dE
	 zIecJjIv3LEsP9UzSHiwktilM/Me0O335+zBXedw9xK+fLCt9KB9Wh/Emnz3MUJ1GS
	 skSI96+vcIr+/7c31ndy2uH3fXs8j4OmIWkXmy56dXPxYHA8r77MvLQtE0Afe/mO1p
	 6YMMODxNm4tLYAR4lbmdY6jJiu7Eqs/nY/wG9AGxNk7SPIJSOvpOYEC2/lK7KRqDUD
	 PUbqTpP2VEZmbypypr22Z5DRSlC7cG54aXvefZJu48X4KFKG50g83Pkd7y83Jp7vaN
	 Tno19lc+JPBjQ==
Date: Wed, 4 Mar 2026 09:34:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-rtc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: rtc: mpfs-rtc: permit resets
Message-ID: <20260304-camouflaged-invisible-rhino-6e3c84@quoll>
References: <20260303-flounder-slate-dd69766990ce@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303-flounder-slate-dd69766990ce@spud>
X-Rspamd-Queue-Id: 0DF361FCBCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6103-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 04:36:33PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The RTC on mpfs and pic64gx has a reset pin, but until now this has been
> undocumented because platform firmware takes the RTC out of reset on
> first-party boards (or those using modified versions of the vendor
> firmware), but not all boards may take this approach. Permit providing a
> reset in devicetree for Linux, or other devicetree-consuming software,
> to use.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


