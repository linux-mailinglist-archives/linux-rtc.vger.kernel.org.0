Return-Path: <linux-rtc+bounces-6467-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEzkOU6c+mkMQQMAu9opvQ
	(envelope-from <linux-rtc+bounces-6467-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 03:41:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 477EB4D55B5
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 03:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94DA5301AD0D
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2026 01:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530DD2580F3;
	Wed,  6 May 2026 01:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="kIAJV+z4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0591E266581;
	Wed,  6 May 2026 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031675; cv=none; b=XaqdKg+So0umJxki099AiVO0e7DXXBtM0EHgljpMwuURZZ36fggtxr0MnmUZvjHg7Ze5aeXpF5QcEd/gqw3JMdCvdndJdpl/IlMK6lKkBkaJfYvs8mZizHNxopH+lq3AXZxu/v+TnqNxRnvrnZaG0lxl68hbv/tsoMJvajdUHAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031675; c=relaxed/simple;
	bh=NnGudMWDL038DLDN3YusenkYJWUMRY5R0BlV4qBzOLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkNHhRct/BRJcw5NtnxTxl7FibVypZDZOrpLkJwH+5bY+I18Fb3odL5DSyvfDEuf1xyj9ggQeCy+ZQBCOBoR/+G33JSnEeME/3NgjDLr4w/IAGrmlP5yYHDl1yUSQhTKdwz0hI/Ip1ekBUiiwZadCR22a4EvaV8rylf6qMQADmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=kIAJV+z4; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 7510720B7168; Tue,  5 May 2026 18:41:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7510720B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778031671;
	bh=59ZI4EgFiglTzZMn/Iq2jHRTVOv2gAQ5yE5umkcmKi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIAJV+z4kIKdc0cwxma5p5IvrI/WdH54CqQKtuq2UCdeBQT3YwgFKKI0HM+OOsbHa
	 Gxv6/Uvu7KzZnmXwJzotaVnNmoaSoSEel+wODgr+e1bFc1YL1Q3GQpqDj377uBMbQf
	 Dodr82TPNNN1nwpRTeLqrM0H3Gl1Fr0rifZ97Jm0=
Date: Tue, 5 May 2026 18:41:11 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
Cc: "meaganlloyd@linux.microsoft.com" <meaganlloyd@linux.microsoft.com>,
	"tgopinath@linux.microsoft.com" <tgopinath@linux.microsoft.com>,
	"giometti@enneenne.com" <giometti@enneenne.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	"sashal@kernel.org" <sashal@kernel.org>,
	"code@tyhicks.com" <code@tyhicks.com>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Message-ID: <20260505-ec9618931e890b4f0f1b62ab@linux.microsoft.com>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
 <20260504-fd90667b1274c4e3a38a0604@linux.microsoft.com>
 <4c097ca4fffed215395ec5979f0f0f43ed85cb97.camel@alliedtelesis.co.nz>
 <20260505-5c718cd011b56364fefc885d@linux.microsoft.com>
 <39365e134ab175492292317ea14bb16172dd580b.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39365e134ab175492292317ea14bb16172dd580b.camel@alliedtelesis.co.nz>
X-Rspamd-Queue-Id: 477EB4D55B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6467-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meaganlloyd@linux.microsoft.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.microsoft.com:dkim,linux.microsoft.com:mid]

Hi Ronan,

On Tue, May 05, 2026 at 10:24:55PM +0000, Ronan Dalton wrote:
> Hi Meagan,
> 
> On Tue, 2026-05-05 at 12:20 -0700, Meagan Lloyd wrote:
> > Hi Ronan,
> > 
> > On Mon, May 04, 2026 at 11:54:32PM +0000, Ronan Dalton wrote:
> > > Hi Meagan,
> > > 
> > > On Mon, 2026-05-04 at 15:08 -0700, Meagan Lloyd wrote:
> > > > > +       case ds_1337:
> > > > > +       case ds_1339:
> > > > > +       case ds_1341:
> > > > > +       case ds_3231:
> > > > > +               ret = regmap_read(ds1307->regmap,
> > > > > DS1337_REG_STATUS, &tmp);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > > > +               if (tmp & DS1337_BIT_OSF)
> > > > > +                       return -EINVAL;
> > > > > +               break;
> > > > 
> > > > If you're going to re-arrange the block to be in somewhat of an
> > > > order,
> > > > perhaps put it above 1338 since 1337 < 1338.
> > > 
> > > I've ordered it this way based on the first case statement in each
> > > block. Since ds_1337 > ds_1308, I've put the block below the block
> > > starting with ds_1308. I could instead order it based on the last
> > > case
> > > statement in each block, if you think that's better.
> > 
> > I agree with your ordering strategy, but your patch inserts it after
> > the
> > ds_1338 case statement block (rather than the intended ds_1308).
> > 
> 
> Here's how it currently is in ds1307_get_time:
> 
> 	case ds_1308:
> 	case ds_1338:
> 		[statement block #1]
> 	case ds_1337:
> 	case ds_1339:
> 	case ds_1341:
> 	case ds_3231:
> 		[statement block #2]
> 
> To insert statement block #2 after the ds_1308 case label would involve
> the following:
> 
> 	case ds_1308:
> 		[statement block #1]
> 	case ds_1337:
> 	case ds_1339:
> 	case ds_1341:
> 	case ds_3231:
> 		[statement block #2]
> 	case ds_1338:
> 		[statement block #1, duplicated]
> 
> Or the following with strict order:
> 
> 	case ds_1308:
> 		[statement block #1]
> 	case ds_1337:
> 		[statement block #2]
> 	case ds_1338:
> 		[statement block #1, duplicated]
> 	case ds_1339:
> 	case ds_1341:
> 	case ds_3231:
> 		[statement block #2, duplicated]
> 
> The case statements can be put strictly in order, but that will involve
> some duplication.

You are absolutely right. I missed that ds_1308 and ds_1338 share a
statement block. No need to change anything, thanks for the clear
explanation!

Reviewed-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>

