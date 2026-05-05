Return-Path: <linux-rtc+bounces-6465-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEPsARFD+mlJLgMAu9opvQ
	(envelope-from <linux-rtc+bounces-6465-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 21:20:49 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EEF4D3138
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 21:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CE13303CC05
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2026 19:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1853D2FE0;
	Tue,  5 May 2026 19:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="P9bNnmiz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A073D170B;
	Tue,  5 May 2026 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008838; cv=none; b=UZi6lsmkU7xHC/TXasdl2Ve1EPqxQUDPqaPfT73+LRIgWjDAd8Oo4IYuyHIQQjr/MrWOF42fPkm2ML1/cB/J8uvj0P1/vCe6AFuAm1DksoPWJ6BuxihZeRjkl5Ivov8OUQXgQscezmOub9AHcBaek0zoDzigFafjIan9EEh6jFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008838; c=relaxed/simple;
	bh=CIpIafS5e0UEYVpq+cr5SxW4HbQ7W0HL/xqNaoUwOxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRjL9Gi2PEfXg4KjWPwgL2bflXGeIMIvmP2+fZWuimHL32j6rp17rBd9ujnlV7C/Ex4bzs6O4xVxYH5JK4bQ5C+XfL9LONi0yn6TxQWN6TjUC14HyO8uQN/nZgGqwTfLo9CRyRpwvOL25RAab3wSaSnoSlvfcKKQzfuhmnJJTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=P9bNnmiz; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 2407E20B7168; Tue,  5 May 2026 12:20:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2407E20B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778008835;
	bh=M+rBjv509Mdoq9V2QIio8Bkt20lVm8CUkKyJCLOekY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9bNnmizW8hRtO5+zybG0yUyfoOfTxowgjsGkVnX8qwWq25xLtNdjHhiM/Xhx1EwX
	 WEZiDqvd45WAEroYM074aWWdmjyZsusQrwilV9fpgbYxJ7D182SgVrlAwZix6IDXxm
	 NFhqqUenS5T0bdbYKfrDr46mZYipT4GovdzwLMdU=
Date: Tue, 5 May 2026 12:20:35 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
Cc: "meaganlloyd@linux.microsoft.com" <meaganlloyd@linux.microsoft.com>,
	"tgopinath@linux.microsoft.com" <tgopinath@linux.microsoft.com>,
	"code@tyhicks.com" <code@tyhicks.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"giometti@enneenne.com" <giometti@enneenne.com>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	"sashal@kernel.org" <sashal@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Message-ID: <20260505-5c718cd011b56364fefc885d@linux.microsoft.com>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
 <20260504-fd90667b1274c4e3a38a0604@linux.microsoft.com>
 <4c097ca4fffed215395ec5979f0f0f43ed85cb97.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c097ca4fffed215395ec5979f0f0f43ed85cb97.camel@alliedtelesis.co.nz>
X-Rspamd-Queue-Id: 57EEF4D3138
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6465-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meaganlloyd@linux.microsoft.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]

Hi Ronan,

On Mon, May 04, 2026 at 11:54:32PM +0000, Ronan Dalton wrote:
> Hi Meagan,
> 
> On Mon, 2026-05-04 at 15:08 -0700, Meagan Lloyd wrote:
> > > +       case ds_1337:
> > > +       case ds_1339:
> > > +       case ds_1341:
> > > +       case ds_3231:
> > > +               ret = regmap_read(ds1307->regmap,
> > > DS1337_REG_STATUS, &tmp);
> > > +               if (ret)
> > > +                       return ret;
> > > +               if (tmp & DS1337_BIT_OSF)
> > > +                       return -EINVAL;
> > > +               break;
> > 
> > If you're going to re-arrange the block to be in somewhat of an
> > order,
> > perhaps put it above 1338 since 1337 < 1338.
> 
> I've ordered it this way based on the first case statement in each
> block. Since ds_1337 > ds_1308, I've put the block below the block
> starting with ds_1308. I could instead order it based on the last case
> statement in each block, if you think that's better.

I agree with your ordering strategy, but your patch inserts it after the
ds_1338 case statement block (rather than the intended ds_1308).


