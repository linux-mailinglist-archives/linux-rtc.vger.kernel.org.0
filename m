Return-Path: <linux-rtc+bounces-6390-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIdGCNdd52l87AEAu9opvQ
	(envelope-from <linux-rtc+bounces-6390-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 13:21:59 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8143A098
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 13:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F0723022558
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Apr 2026 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634563BD648;
	Tue, 21 Apr 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCWAgGob"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FED13B95E0
	for <linux-rtc@vger.kernel.org>; Tue, 21 Apr 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770511; cv=none; b=rpj1pv+CqLX0W4Y7BJkL1UHAa0PR2Qc1xrPeHdmXOWdA1t3LLAmot/HyoqGndaGBhnplj+yidb3oYlBIJv1j1uujZri43HVQbDhobuq6rS7fyzct8Z36BD1vy9sj0OdvyqVfO8RwKEl+446WOgst22a6z5NJfdIer6VNM07MPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770511; c=relaxed/simple;
	bh=9s8/6CxAimRxSBzycRWJAays1e9oC2blAl7hbQ4gthM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZH0yx5YFieqJRI436WkBg6oZGUJzKBCNDqGXpF53FT1oOuRMJPDY5gm0s+2yjqG0LEI3zqsYp8r48H4WvwqeDZjcSTP+RMSIcTXKfexEpk3FHT5JDKGrlKrSRApfCX/s2TJxUKH9WfLxjNtVym2JXQRDPlaTsCezyMl9C2SOis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCWAgGob; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2371C2BCB8
	for <linux-rtc@vger.kernel.org>; Tue, 21 Apr 2026 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776770511;
	bh=9s8/6CxAimRxSBzycRWJAays1e9oC2blAl7hbQ4gthM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eCWAgGob4ru5rmVKZXHGN1rgp4N4E29mvj8oML1mkerMFOyh/gje8QrwIPevd7vxh
	 vRyyOiOAGniq0SdA9lhCW95uraysEJunixqCPH6i3gPPCNtudkbd+AKlhWVt1LE616
	 vrab/W6qIPVIeuh4KXr/Yugar73d23YBT10dmiCff+Zq1RmFH/OGCJxiQVEbLxYzie
	 /nHUA5tR+n5tDuSzj1eA0BpmSXywBt+WH6LE6v5goohNVANcRvVYaaL6EDPjGP5Yd7
	 p8+YzHXHEHrtYUdAAIMQMQxcJCEFtrp/a1fapgaiH61szJhKXLWAHbjfvT6wJacelC
	 2jwlsNFOU7iCg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a62a049c1fso1099555e87.3
        for <linux-rtc@vger.kernel.org>; Tue, 21 Apr 2026 04:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pxIoGHvxD5RQxY/tzzzxUQIP0sPMBsUxMWUUvHV8Ljoe5LIEn0usEGbtFoNgPE+jSSBsSyY8JZf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx55Q9+DE6s0nmLEQH5BNbxC/1BSrFwSM0mVJjqTkzjRFwa2lBS
	ra8t9ZfnCx1frEre/WTmLVJphuflIo9imIWCi3wofG7euLCGTemxHSzfz+uWBXV6+8sNKCpYEmS
	Mi4xq7fAHaUpZvAbhlPnq7I1X1QuKr6c=
X-Received: by 2002:a05:6512:1285:b0:5a1:33b6:2b6d with SMTP id
 2adb3069b0e04-5a4172c590dmr7176236e87.14.1776770509364; Tue, 21 Apr 2026
 04:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419223630.67644-1-m32285159@gmail.com>
In-Reply-To: <20260419223630.67644-1-m32285159@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Apr 2026 13:21:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQD_ZSFPGrx4uL+ezrR1Ai2ddUF9_PpesDG+AEwiDrag@mail.gmail.com>
X-Gm-Features: AQROBzD3vULz9bpY6-B9483r_xgyXE67qFa2sjkZj_vQ2SieZ3MVsEEIVSb4PuE
Message-ID: <CAD++jLkQD_ZSFPGrx4uL+ezrR1Ai2ddUF9_PpesDG+AEwiDrag@mail.gmail.com>
Subject: Re: [PATCH] rtc: ab8500: replace sprintf() with sysfs_emit()
To: Maxwell Doose <m32285159@gmail.com>
Cc: alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6390-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 81F8143A098
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 12:36=E2=80=AFAM Maxwell Doose <m32285159@gmail.com=
> wrote:

> This patch replaces sprintf() with sysfs_emit() to ensure proper
> bounds checking. It also simplifies the return logic by directly
> returning the error after logging, instead of logging, calling
> sprintf(), then returning.
>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

