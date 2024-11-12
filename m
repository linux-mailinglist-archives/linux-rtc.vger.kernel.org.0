Return-Path: <linux-rtc+bounces-2529-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89099C4FE0
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 08:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F711B28D59
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 07:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0160320C018;
	Tue, 12 Nov 2024 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="bdv67QQf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0720BB59;
	Tue, 12 Nov 2024 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397460; cv=none; b=MUki1naqs92mBkXOj5/XDGGQzajsTnb15pFnnHsEwQN5hEhLpVhz1Gr11Mzs0mIyYoLk604Ouz8QGfQzPh8Ey2jmhGZYXkCJ5rfWVpK2pLzR3zE0YXHF8nKebYMu3BpvqsmkLi37wANjy7JSxYt5LPG8WHXVDdDTOQFdmNC0idA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397460; c=relaxed/simple;
	bh=x2ua2USJVM8FxXVp18G3kQbTxWx3p894vl1R/r+UMfg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:To:From:Cc:
	 References:In-Reply-To; b=SYGTp3kYVma+GsKFQJbtGsAU3lkQtuSp0LpTNl6f6jgpDDZKL1v2aclmN73PJr2VFM0CRToYTqRBLCr36quULde8Hwowr2q0teVD+UlcDmgaSDb/Thv3hxyhTKA8gfIU5zvupFCAae8L6HSQbJL7pKpfX0uYI9vGA2bxBC33oXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=bdv67QQf; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1731396007; x=1732696007;
	bh=S6iM5RqKzxExJqEtglYbXBXWxKbxcAgVmoPl/2aSlU0=; h=From;
	b=bdv67QQfr4H9s+tGJChS7AH8r/7MmuIJf0GQZP9EzASr9KbWZnS7+FE8TsCcEnDFM
	 VCMj/sQK1BeZ+F+0ZCKw96awT07iNNHzIhYQ+DmoJFjWQ7f3JZZQHGxgDHxWzb8Eqt
	 5FcYqeUoeq0deMMoU/EMxftd+aleo9sPr4wX048mKbZMvrjzGyhLBIZ+gXvTMMSCfO
	 S9+8Jq0NAPsTbgEtiXHYsf/Wfb0/YaM8IVtuyLlCEN2TVBcagh5QREuB5GxBfVevY+
	 wN+lB0UdKklLLcLLi5YGB+9q5q3LD18FLtwQlZtuDo4ZzDXcGlVcEzcWsLzXUZIoWi
	 srqtiUoKctbzg==
Received: from localhost (90-176-225-75.rcj.o2.cz [90.176.225.75])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 4AC7K55m085697
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 12 Nov 2024 08:20:07 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Nov 2024 08:21:08 +0100
Message-Id: <D5K0OL5FSDNH.1LBD86S2ZF706@matfyz.cz>
Subject: Re: [RFC PATCH v2 1/2] mfd: 88pm886: add the RTC cell
To: "Lee Jones" <lee@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <duje.mihanovic@skole.hr>, <phone-devel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20241012193345.18594-1-balejk@matfyz.cz>
 <20241015083603.GB8348@google.com>
In-Reply-To: <20241015083603.GB8348@google.com>

Lee Jones, 2024-10-15T09:36:03+01:00:
> On Sat, 12 Oct 2024, Karel Balej wrote:
>
> > Add a MFD cell for the chip's real-time clock.
> >=20
> > Signed-off-by: Karel Balej <balejk@matfyz.cz>
> > ---
> >=20
> > Notes:
> >     RFC v2:
> >     - Break out the register definitions and reword the commit message
> >       accordingly.
> >     - RFC v1: https://lore.kernel.org/r/20240920161518.32346-1-balejk@m=
atfyz.cz/
> >=20
> >  drivers/mfd/88pm886.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Looks fine.  Let me know when you're ready for me to take it.

I'm ready :-)

Thank you,
K. B.

