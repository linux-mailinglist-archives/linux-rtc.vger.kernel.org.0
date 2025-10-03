Return-Path: <linux-rtc+bounces-5044-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086ABB71F0
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Oct 2025 16:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BEE04E1B8D
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Oct 2025 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2851FCFEF;
	Fri,  3 Oct 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="odwYzyHQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C731F8908;
	Fri,  3 Oct 2025 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759500550; cv=none; b=EMokvZTk8uh1dkRFCchcRG/dqnoYzGFIr5tXZqzCzvzWeQzHml68WmhdiZ715yiWyhCu0+twfCho1/RJmjTmLVBMwhmbQfcNBvrMkTxKfw3zXXCPYHeQYCKWIAls+uZX1vWMBktysLPVu1Z/OC+Slrj8/oUf7vdx4EC8ny3HS9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759500550; c=relaxed/simple;
	bh=F/+PDE1tSu4AWb/pC72fDq6Xw7sFkQzOxZcOMmkZQJY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mmBpfzx6qpz3J65dQd0Bf0hZNu3jK7UwRguWkq/+mpsAiOW+fxGo9U/IPOBftWMFsIK81/8SeQpd06ImPd89MWqevR7L1CrTMeSTkYphWsPHemUJsfDAGmk1twfQr5Htgc1XvLHWHjyML/o33giWQYeGTDSGYMXIeoDz5HgYerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=odwYzyHQ; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759500526; x=1760105326; i=markus.elfring@web.de;
	bh=DDl2pdHmAAIIL9lVozonx+Ae31V9FWKU1vcvML7OSZU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=odwYzyHQsNY4Huv4CfNa50Zgoa1mfeARfv5rLAD/8X6/ZO4ahfzDr6mzrJQ5hDDS
	 ofhaMAF0PBtqQMq7iQrk2Qh69pahgBAx3PlMwX02gLbQ6mkFrCLvedHtC7t+G6ZW+
	 /Ji+6I2myfi4KO04aJBZMsj6+VpNk46vfX8D3/cSwAQkd9GEDvq3OiOvuXgizmnlo
	 zRT9bpM8pqseqTyiWHQazbjWkzH2llcm3d+sWqUNwbgUaujbIqt/NOwOgZckh0xmq
	 1p9vaHUGr6C++r0MRudp0lLsEPdSiLeQUYEZ+vnr1hvTKBZKc0wQQzUQ1Wqpw8HSd
	 TGZq8ANO/QpV7srGyw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRk0W-1ut5qm28Hy-00OSg9; Fri, 03
 Oct 2025 16:08:46 +0200
Message-ID: <482bc540-1b37-4a81-ace9-1b27df91b27d@web.de>
Date: Fri, 3 Oct 2025 16:08:45 +0200
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
References: <20251002092045.11-1-alsp705@gmail.com>
Subject: Re: [PATCH] rtc: fix error return in pm80x_rtc_set_time()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251002092045.11-1-alsp705@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H7Lvqpa1Xswb1bpUwYTeNvIurB/UjK19FNIl/Lw4GkejYITa52N
 1qbxS5Mo6VaHSQ1lkflTzhpMpgBozrGFA/Tk2pxlr8U0S7pqLpzu3q0+OC787/fObYcHe9h
 Z5e8KnXVsmmXkQ5lVOM1S2ugE1Dj7vnF0AY+Le10iDNMsSnHRtsBITRSygZeTsk8T9iBqxi
 4IGs+u7GBLXpt2SQRUM6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x8PF23w0Ylk=;WoWKO7O+DX7sVE8pZgz4ByUnxr4
 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
 IhHWKHDnCgOH5A1PDT+2md3CZP2sp0jlRN0=

> The regmap_raw_read() function may return an error.

* Would you like to choose another imperative wording for an improved chan=
ge description?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.17#n94

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus

