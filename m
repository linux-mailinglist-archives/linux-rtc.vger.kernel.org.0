Return-Path: <linux-rtc+bounces-6538-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEHiL9W/Cmrb7AQAu9opvQ
	(envelope-from <linux-rtc+bounces-6538-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 09:29:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7699C56788F
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 09:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E48D303FFE4
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 07:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B523D2FE0;
	Mon, 18 May 2026 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHuzrYDW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC563D16EB;
	Mon, 18 May 2026 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089077; cv=none; b=JCu7BjiHod9HgQBNxDbDQV/LeLOLN5qr55d1cJh6OMoAOpvoXSJYwwi/UThrBfZp+UTTjctxG1B6alUPeA6fS0+ejbsOEJf1ILMIQdRZNvBV88T57nMxq6zeX8kpm2bVP4kp1BKmCPX2KMS8TneIQBlTgZmlfkqucZ2tFNjdb4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089077; c=relaxed/simple;
	bh=hixQLe8PG4T4h8LbMRcfKQX69jiNV3tNufb7ppGNWy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsVprcFwNjX+FHwle9sFQMAwzg1LpM4u36PNPMecE4cBHRI9F10llajggZglMDTg2vAmnQUYV6XQG6qBFz8/lXKL3uuYOfZd9o4hB0oTxSsgdCt7QQqDtzI4h4UTWxhw/BuIYH2ps5CRsCFHBamV3Mw2Ho8sh4FnRHopJkHbWpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHuzrYDW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754C8C2BCC6;
	Mon, 18 May 2026 07:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779089077;
	bh=hixQLe8PG4T4h8LbMRcfKQX69jiNV3tNufb7ppGNWy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHuzrYDWF6pr2XP2/HOqsC7xaj5d+a6156QlCRrdqMrckGtD+mMyM0/kHJ3ERBtYs
	 vnPalP+Nbpt/40OWkLjm8xBD9Q4njIkhh5eMKAXGMAcwufpKBCPIHCSms7MRARSduM
	 GghWRhfh0ZVd6uS68ZbLcw8lMTO6TLRTBLPGC0x2mlcsKv7wInPfq24zxq315oQxke
	 dQ+bPPrKzK/YG0u+QLMTSWWkQYq7StftQ+ldEcMpf5aQ8MRr0rVAJnrFfFxaSGPxdU
	 2TDEmFc90/uvmLDLe6fdfX3lSbQIJ18y4C1TbsCfQUskibh89yOt258t6EKSvwgclT
	 tmcbjEUhjGNbQ==
Date: Mon, 18 May 2026 09:24:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Message-ID: <20260518-smooth-prophetic-ermine-3f5c8c@quoll>
References: <20260514173851.25088-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514173851.25088-1-challauday369@gmail.com>
X-Rspamd-Queue-Id: 7699C56788F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6538-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 11:03:32PM +0530, Udaya Kiran Challa wrote:
> Convert the Epson RX6110 Real Time Clock devicetree binding
> from the legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


