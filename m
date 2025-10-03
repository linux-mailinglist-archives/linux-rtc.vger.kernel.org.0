Return-Path: <linux-rtc+bounces-5045-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F4BB7431
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Oct 2025 17:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E8DD346729
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Oct 2025 15:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAA14501A;
	Fri,  3 Oct 2025 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ao3IPuj4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B94A23;
	Fri,  3 Oct 2025 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759503629; cv=none; b=hkvy9RCBv3hMKP60cpLOPfzikK2uZgV1I+HTZ91JeTeOQGEG0cGnP+fQstY5VqBCr/yAnOYlOvHXodbq6mmJQfCmX/gi0l65EpdTUk/3MPsIw15hzjV6ZEBhAVdxu1XkNb1kEi8fjrAxx0AWWc6UI1UPzpSbsPCSqbMr+yD0U+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759503629; c=relaxed/simple;
	bh=GEhdcjXwDhZQembPpgrwEAQTdhCK5WvAZhj/v2/ln4U=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FXzA5QIa+Ckoxgp2paUpPqcW0S4+se66hPwIrd5uP5GRoWJIyT9j436m7Om3Wgyk2zxbHIjx7I6CcYSXbjFF1RoV46E4G6VShSxVZMtaXiFs15295mekRHvIz+Z22SYINTwdI69I/UTzfq/Pju+sPR3/IBSohQqHVd/jTjnwYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ao3IPuj4; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759503624; x=1760108424; i=markus.elfring@web.de;
	bh=YQagvzeqs3XSQ12HnNXPQvf5kqPtTWWe6J75TAo9ZSY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ao3IPuj4iiHgauNMqmBVPMqcQfy3130ydXbfdNKyJ7X/cg88E5uW3bzSiU3PQ0nB
	 n+gFhoVNEtzHTUpafOOWvyezHg8HHezJwMH0Ny6tRnOLCBK7TATfhkMFOLoPECbsV
	 8R5O0tM2E8Xy9IUtTuFiR5QD6h4E/SFti91N9ROroi9q8+WO4cT1bWTaeNkbpppaQ
	 Xv+YBsimwSxlUuzHjfnOy90Ttg10o2E/hKkBIYXG9YCbjROrSN1EXoOBiVYqYFNxR
	 W2bYmD7p+c2b+wlsUoLQ2pgxDoo6MhscE2KR0+hk3nQkEtzcTk4iK1MXeVdK9/IsB
	 o+xlblcrs27MhhLh7w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmyr7-1ucCQ31xqh-00f26C; Fri, 03
 Oct 2025 17:00:24 +0200
Message-ID: <c22b876c-be93-4477-9c44-776b8839d524@web.de>
Date: Fri, 3 Oct 2025 17:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandr Sapozhnikov <alsp705@gmail.com>, linux-rtc@vger.kernel.org,
 lvc-project@linuxtesting.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20251002091822.26-1-alsp705@gmail.com>
Subject: Re: [PATCH] rtc: fix error return in pm80x_rtc_read_alarm()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251002091822.26-1-alsp705@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eKn20IDqKY2ubyHSKxktqqAukrdPm1AS+BcloyH2R7VVwkS4We1
 FDaRqnSpvk+ttP4/WTr+loj95sgJKB9200+9CMSFAzPBGzdHeSzgDci72slFrIGHlC86GmM
 wEkirPVAt6fyF2GUBIfpnndiahQyBQlVPPbA5JaG8UlNYXm+7GdOHSuFBR1yluXxaZuPcUd
 Tk7LPDIY/CY1XyFbonC+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8BChGQkcD3g=;HFu70iMCvzk4tE5MwrlcHscy/ln
 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

> The regmap_raw_read() function may return an error.

* Would a corresponding imperative wording become helpful for an improved =
change description?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.17#n94

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus

