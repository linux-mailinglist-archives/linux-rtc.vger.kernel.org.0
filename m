Return-Path: <linux-rtc+bounces-6609-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0gHkeWHmrPlAkAu9opvQ
	(envelope-from <linux-rtc+bounces-6609-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 10:37:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D05EF62AAC2
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 10:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31B7A3018BDE
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 08:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160BE3C5848;
	Tue,  2 Jun 2026 08:31:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD537CD20;
	Tue,  2 Jun 2026 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389117; cv=none; b=HJgH5iK/YVEwiGjgxApEWVL1ThsVMbbzadAmEfF3TCLn8IpjnRZMfC7EuyoFPkfZf2A4gOpxhLsxvQz+nTWVHsFM1QCwwTOWCXy5nq/NNgixAI/UG2Gd202iWg4Jagwkore9ShD0QjNX8jyAfIiThJLNNsQTW1O6WxLTSVpRgWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389117; c=relaxed/simple;
	bh=ChGlVjhD1oeKnMqlYdNzx2F1AJ6mT3VcM1r2RVhbJDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJLJXDazFJ3WMxjwDLmX9xiegwLcJKovGvkKzSinQJrCDobEtGmGlFngZpkObCSn5cFLhVGF4hhd1lOIn1C427GCrkYh28NkzE6KxvM2Rd3NJxkRgDJu7pyWNXAaPIemexhUxGCbQTSOwuJEm/kmOTxpkU8CD7XFRIFGvP3HTd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC241F00893;
	Tue,  2 Jun 2026 08:31:52 +0000 (UTC)
Message-ID: <7f6fe294-582d-4668-aa77-ad9ab47cce2e@tuxon.dev>
Date: Tue, 2 Jun 2026 11:31:51 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition
 in alarm setup error path
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506164914.3987293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260506164914.3987293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6609-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,bootlin.com,bp.renesas.com,glider.be];
	DMARC_NA(0.00)[tuxon.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,tuxon.dev:mid]
X-Rspamd-Queue-Id: D05EF62AAC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Prabhakar,

On 5/6/26 19:49, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> In rtca3_set_alarm(), the setup_failed path attempts to disable the
> Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
> However, the polling condition passed to readb_poll_timeout_atomic()
> uses an incorrect expression:
> 
>      !(tmp & ~RTCA3_RCR1_PIE)
> 
> As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
> condition effectively waits for all non-PIE bits to become zero, which
> is unrelated to the intended operation and is unlikely to ever be true.
> This causes the poll to time out unnecessarily.
> 
> Fix the condition to check for the PIE bit itself being cleared:
> 
>      !(tmp & RTCA3_RCR1_PIE)
> 
> This correctly waits until PIE is deasserted after being cleared.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

I think it also deserves a Fixes tag?

Thank you,
Claudiu

