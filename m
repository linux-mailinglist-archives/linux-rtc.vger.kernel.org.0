Return-Path: <linux-rtc+bounces-6611-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGMIAaiXHmoAlQkAu9opvQ
	(envelope-from <linux-rtc+bounces-6611-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 10:43:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB3062AC66
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 10:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84C5630011B9
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD5E3921DD;
	Tue,  2 Jun 2026 08:32:34 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E53B38B7;
	Tue,  2 Jun 2026 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389154; cv=none; b=LTYNL7+grPC1281z6vOuZextq1p/ydGmGuhl6EInt0jjriAV9Ou0w++7G6b9sn8ELfCw9d2bvgOhRsOKgPoYnesgfjbILlSKn4+EtO0IzvYHw6pB0q8oVxqVbbN8yoMVoSk3qiBUS7vBCQ/p+Av9wEk3RhSo0sT6LM1erCzYNdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389154; c=relaxed/simple;
	bh=ndHGN0UXh11XcWnTob2TUzx8bQhOe3x9CAkDAynTgZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJySaSFtN4FEJ9vyPcCQTXmhoUjZpcpezAHo7ZIy35r63UVrA3muQkGrjYo1qtMl9ygt4peC6KxZ6cShAzg0WN8yhe0ih4ONFeHj97cmiuAJO8jWsNA5tuHrL3RO8ylVFTJ9FrgdV9HKb2Sx89p5dhaZLzuIB7MVZ/3dF/N+8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7731F00893;
	Tue,  2 Jun 2026 08:32:31 +0000 (UTC)
Message-ID: <4fc2bc34-18c9-48ea-bf7e-fc12117f6ed3@tuxon.dev>
Date: Tue, 2 Jun 2026 11:32:30 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] rtc: renesas-rtca3: Fix incorrect error message for
 reset assert
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506164914.3987293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260506164914.3987293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6611-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 6EB3062AC66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/6/26 19:49, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the message to "assert reset" to accurately reflect the
> operation being performed.
> 
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

